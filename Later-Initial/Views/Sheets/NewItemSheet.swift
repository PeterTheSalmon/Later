//
//  NewItemSheet.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-07.
//
import SwiftUI

struct NewItemSheet: View {
	@ObservedObject var folderListViewModel: FolderListViewModel

	// To dismiss sheet
	@Environment(\.dismiss) var dismiss

	// Values for new link item
	@State private var title = ""
	@State private var urlString = ""
	@State private var isFavourite = false
	
	@State var parentFolderViewModel: FolderViewModel

	@Binding var selectedFolder: FolderItem?
	

	// Statistics to update
	@AppStorage("notesCreated") var notesCreated = 0
	@AppStorage("selectedSortStyle") var selectedStyle = 0

	// ObservedObject for the LinkViewModel
	@ObservedObject var linkListViewModel: LinkListViewModel

	private func addLink() {
		
		let link = LinkItem(title: title,
		                    url: CheckURLConventions(urlString: urlString),
		                    isFavourite: false,
												parentFolderId: parentFolderViewModel.folder.id!)
		linkListViewModel.add(link)
		notesCreated += 1
		dismiss()
	}

	private func addFavouriteLink() {
		let link = LinkItem(title: title,
		                    url: urlString,
		                    isFavourite: true,
												parentFolderId: parentFolderViewModel.folder.id!)

		linkListViewModel.add(link)
		notesCreated += 1
		dismiss()
	}

	var body: some View {
		VStack {
			Label("Add New Item", systemImage: "link.badge.plus")
				.font(.title)
				.padding(.bottom)

			Form {
				TextField("Title", text: $title, prompt: Text("Title"))
					.font(.title2)

				TextField("URL", text: $urlString, prompt: Text("URL"))
					.font(.title3)
					.onSubmit {
						addLink()
					}

//				Picker("Folder", selection: $folderListViewModel.folderViewModels[0]) {
//					ForEach(folderListViewModel.folderViewModels) { folderViewModel in
//						Text(folderViewModel.folder.name)
//					}
//				}
				
//				Picker("Folder", selection: $selectedFolderViewModel) {
//					ForEach(folderListViewModel.folderViewModels, id: \.self) { folderViewModel in
//						Text(folderViewModel.folder.name)
//					}
//				}
				
				Picker("Folder", selection: $parentFolderViewModel) {
					ForEach(folderListViewModel.folderViewModels, id: \.self) { folderViewModel in
						Text(folderViewModel.folder.name)
					}
				}
				
				.font(.title3)
			}
			.textFieldStyle(.roundedBorder)
			.padding(.leading)
			.padding(.trailing)
			.padding(.bottom)

			// MARK: Save buttons

			HStack {
				Button { // save normally
					addLink()
				} label: {
					Label("Save", systemImage: "tray.and.arrow.down")
				}
				.buttonStyle(SaveButton(colour: Color.accentColor))
				.keyboardShortcut(.defaultAction)

				Button { // save as fave
					addFavouriteLink()
				} label: {
					Label("Save as Favourite", systemImage: "star")
				}
				.buttonStyle(SaveButton(colour: Color.accentColor))
			}
		}
		.frame(width: 400, height: 220)
		.onExitCommand { dismiss() }

	}
}

struct NewItemSheet_Previews: PreviewProvider {
	static var previews: some View {
		NewItemSheet(folderListViewModel: FolderListViewModel(), parentFolderViewModel: FolderViewModel(folder: FolderItem(name: "testing")), selectedFolder: .constant(FolderItem(name: "testing")), linkListViewModel: LinkListViewModel())
	}
}
