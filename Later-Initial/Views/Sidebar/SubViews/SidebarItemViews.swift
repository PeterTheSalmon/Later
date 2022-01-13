//
//  ListItemView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

/// this file has two views - one for the standard list item for folders, and one for other items contained in the "more" header

import SwiftUI

struct SidebarFolderItemView: View {
	// Detect wether the user is in light or dark mode.
	// This is used to change the colour in the folder edit view to be something more pleasing to the eye
	@Environment(\.colorScheme) var colorScheme

	@Binding var name: String
	@State private var isHoveringTrash = false

	@Binding var justDeletedFolder: Bool
	@Binding var folderViewModel: FolderViewModel
	@ObservedObject var folderListViewModel: FolderListViewModel
	@Binding var selectedFolder: FolderItem?

	@State private var deleteAlertPresented = false // this is for deleting
	@State private var editPopoverPresented = false
	@State private var folderColour = Color.primary

	// If true, folders are deleted in one click
	@AppStorage("instantDeleteFolder") var instantDeleteFolder = false

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

	func deleteFolder() {
		folderViewModel.remove()
	}

	var body: some View {
		HStack {
			Image(systemName: folderViewModel.folder.iconName ?? Icons().folder)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.foregroundColor(folderViewModel.folder.colour ?? nil)
				.frame(width: 14, height: 14)

			Text(name)

			Spacer()

			/// The AppSettings folderID value is assigned to the uncategorized folder when the folderList is initialized.
			/// We can ensure that it is never deleted by disabling these features if the folder id matches that value
		} // *HStack
		
		/// if the folder colour isn't set to default (Color.primary), adjust the folderColour state to reflect this colour
		.onAppear { if folderViewModel.folder.colour != nil { folderColour = folderViewModel.folder.colour! } }

		/// find which symbol is associated with the folder already
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

		/// popover for editing folder values
		.popover(isPresented: $editPopoverPresented, arrowEdge: .trailing) {
			VStack {
				HStack {
					ColorPicker("Folder Colour", selection: $folderColour, supportsOpacity: false)
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
			folderViewModel.folder.colour = folderColour
		}

		.onChange(of: symbolName) { _ in
			folderViewModel.folder.iconName = symbolNames[symbolName]
		}

		/// hover check to see if buttons should have opacity or not
		.onHover { hovering in
			isHoveringTrash = hovering
		}

		/// alert before deleting items - if one-click deletions are on from preferences this won't show
		.alert(isPresented: $deleteAlertPresented) {
			let confirm = Alert.Button.destructive(Text("Confirm")) { deleteFolder() }
			let cancel = Alert.Button.cancel(Text("Cancel")) {}

			return Alert(title: Text("Delete \"\(folderViewModel.folder.name)\"?"), message: Text("All links in the folder will be deleted"), primaryButton: confirm, secondaryButton: cancel)
		}
	}
}

struct SidebarExtraItemView: View {
	var name: String
	var imageName: String

	var body: some View {
		HStack {
			Image(systemName: imageName)
				.frame(width: 14)
			Text(name)
			Spacer()
		}
	}
}
