//
//  FolderManagerView.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-07.
//

import SwiftUI

struct FolderManagerView: View {
	// MARK: Passed-in objects

	@ObservedObject var folderListViewModel: FolderListViewModel
	@ObservedObject var linkListViewModel: LinkListViewModel
	@Binding var isShowingNewItemSheet: Bool

	@AppStorage("folderSheetPresented") var folderSheetPresented = false

	// MARK: Searching variables

	@Environment(\.isSearching) var isSearching
	@Binding var query: String

	var body: some View {
		if isSearching && !query.isEmpty {
			let filteredFolders = folderListViewModel.folderViewModels.filter { folderViewModel in
				folderViewModel.folder.name.uppercased().contains(query.uppercased())
			}


			VStack {
				ScrollView {
					ForEach(filteredFolders) { folderViewModel in
						FolderListedView(folderViewModel: folderViewModel, linkListViewModel: linkListViewModel, folderListViewModel: folderListViewModel)
					}
				}
			}
			.padding()
			.navigationTitle("Searching Folders...")
			.frame(width: 350)
			.onDisappear {
				folderSheetPresented = false
			}
			.toolbar {
				ToolbarItem(placement: .navigation) {
					Button {
						toggleSidebar()
					} label: {
						Image(systemName: "sidebar.left")
					}
				}
				
				ToolbarItem(placement: .navigation) {
					Button {
						isShowingNewItemSheet = true
					} label: {
						Image(systemName: "plus.circle.fill")
					}
					.help("New Item")
				}
			}
			.sheet(isPresented: $folderSheetPresented) {
				NewFolderSheet(folderViewModel: folderListViewModel, allowExitCommand: true)
			}
			.sheet(isPresented: $isShowingNewItemSheet) {
				NewItemSheet(folderListViewModel: folderListViewModel,
										 parentFolderViewModel: folderListViewModel.folderViewModels[0],
										 linkListViewModel: linkListViewModel)
			}
			
		} else {
			VStack(alignment: .leading) {
				Group {
					Text("Manage folders")
						.font(.title)
						.padding(.top)

					Text("Total Folders: \(folderListViewModel.folderViewModels.count)")
						.font(.title3)

					Button { folderSheetPresented = true } label: { Label("New Folder", systemImage: "folder") }
						.buttonStyle(.borderless)
						.padding(.top, -5)
				}

				Divider()
				ScrollView {
					ForEach(folderListViewModel.folderViewModels) { folderViewModel in
						FolderListedView(folderViewModel: folderViewModel, linkListViewModel: linkListViewModel, folderListViewModel: folderListViewModel)
					}
				}
			}
			.navigationTitle("Manage Folders")
			.padding(.horizontal)
			.frame(width: 350)
			.onDisappear {
				folderSheetPresented = false
			}
			.toolbar {
				ToolbarItem(placement: .navigation) {
					Button {
						toggleSidebar()
					} label: {
						Image(systemName: "sidebar.left")
					}
				}

				ToolbarItem(placement: .navigation) {
					Button {
						isShowingNewItemSheet = true
					} label: {
						Image(systemName: "plus.circle.fill")
					}
					.help("New Item")
				}
			}
			.sheet(isPresented: $folderSheetPresented) {
				NewFolderSheet(folderViewModel: folderListViewModel, allowExitCommand: true)
			}
			.sheet(isPresented: $isShowingNewItemSheet) {
				NewItemSheet(folderListViewModel: folderListViewModel,
				             parentFolderViewModel: folderListViewModel.folderViewModels[0],
				             linkListViewModel: linkListViewModel)
			}
		}
	}

	private func toggleSidebar() {
		NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
	}
}

struct FolderListedView: View {
	// Detect wether the user is in light or dark mode.
	// This is used to change the colour in the folder edit view to be something more pleasing to the eye
	@Environment(\.colorScheme) var colorScheme

	@ObservedObject var folderViewModel: FolderViewModel
	@ObservedObject var linkListViewModel: LinkListViewModel
	@ObservedObject var folderListViewModel: FolderListViewModel

	@State private var deleteAlertPresented = false
	@Environment(\.dismiss) var dismiss

	@AppStorage("instantDeleteFolder") var instantDeleteFolder = false

	/// Editing supplies
	@State private var editPopoverPresented = false
	@State private var folderColour = Color.primary
	@State private var symbolName = 0
	var symbolNames = [
		"folder",
		"display",
		"music.note",
		"star",
		"link",
		"cloud.fill",
		"externaldrive",
		"wrench.and.screwdriver",
	]

	private func editFolder() {
		var updatedFolder = folderViewModel.folder

		/// As Color.Primary can't be encoded, we can only change the folder colour to not primary
		if folderColour != Color.primary {
			updatedFolder.colour = folderColour
		}
		updatedFolder.iconName = symbolNames[symbolName]
		update(item: updatedFolder)
	}

	private func update(item: FolderItem) {
		folderViewModel.update(item: item)
	}

	var body: some View {
		let numberOfLinks = linkListViewModel.linkViewModels.filter { $0.link.parentFolderId == folderViewModel.folder.id }.count

		ZStack {
			RoundedRectangle(cornerRadius: 2,
			                 style: .circular)
				.frame(height: 25)
				.foregroundColor(Color("BG"))

			HStack {
				Image(systemName: folderViewModel.folder.iconName ?? "folder")
					.foregroundColor(folderViewModel.folder.colour ?? .primary)
					.frame(width: 14)

				Text(folderViewModel.folder.name)
					.foregroundColor(.primary)

				Text("[\(numberOfLinks)]")
					.foregroundColor(.secondary)
					.help("\(numberOfLinks) links")

				Spacer()

				Button("Edit") { editPopoverPresented = true }.buttonStyle(DisplaySheetButtonStyle(hoveringReference: true, item: LinkItem(title: "", url: "", parentFolderId: "")))

				if folderListViewModel.folderViewModels.count > 1 {
					Button("Delete") {
						if instantDeleteFolder { deleteFolder() } else { deleteAlertPresented = true }
					}.buttonStyle(DisplaySheetButtonStyle(hoveringReference: true, item: LinkItem(title: "", url: "", parentFolderId: "")))
				}
			}
			.padding(.horizontal, 5)
		}
		.frame(maxWidth: 318)

		// If the folder isn't the default colour, set the colour picker to the folder's colour
		.onAppear { if folderViewModel.folder.colour != nil { folderColour = folderViewModel.folder.colour! } }

		// Find the index of the folder's icon
		.onAppear {
			var initialIndex = 0 // start the count at zero, representing the folder
			for possibleSymbol in symbolNames {
				if possibleSymbol == folderViewModel.folder.iconName {
					symbolName = initialIndex
					/// if the symbol matches the value in the folder,
					/// let symbolName take the value of the index of that icon
				}
				initialIndex += 1
			}
		}

		// Edit popover
		.popover(isPresented: $editPopoverPresented, arrowEdge: .trailing) {
			VStack {
				HStack {
					ColorPicker("Folder Colour", selection: $folderColour, supportsOpacity: false)

					/// Reset button
					Button {
						if colorScheme == .dark {
							folderColour = .white
						} else {
							folderColour = .black
						}
						folderViewModel.folder.colour = nil
					} label: {
						Image(systemName: "gobackward")
					}
					.buttonStyle(.borderless)
				}

				Picker("", selection: $symbolName) {
					ForEach(0 ..< symbolNames.count) {
						Image(systemName: symbolNames[$0])
					}
				}
				.pickerStyle(.segmented)

			}.padding()
		} // popover

		.onChange(of: folderColour) { _ in
			editFolder()
		}

		.onChange(of: symbolName) { _ in
			editFolder()
		}

		.alert(isPresented: $deleteAlertPresented) {
			let confirm = Alert.Button.destructive(Text("Confirm")) {
				deleteFolder()
			}

			let cancel = Alert.Button.cancel(Text("Cancel")) {}

			return Alert(title: Text("Delete \"\(folderViewModel.folder.name)\"?"),
			             message: Text("All links in the folder will be deleted. This action can not be undone"),
			             primaryButton: confirm,
			             secondaryButton: cancel)
		}
	}

	private func deleteFolder() {
		// Remove all links in the folder before deleting the folder
		for linkViewModel in linkListViewModel.linkViewModels {
			if linkViewModel.link.parentFolderId == folderViewModel.folder.id {
				linkViewModel.remove()
			}
		}
		folderViewModel.remove()
	}
}

struct FolderManagerView_Previews: PreviewProvider {
	static var previews: some View {
		FolderManagerView(folderListViewModel: FolderListViewModel(), linkListViewModel: LinkListViewModel(), isShowingNewItemSheet: .constant(false), query: .constant("test"))
	}
}
