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

	// Statistics to update
	@AppStorage("notesCreated") var notesCreated = 0
	@AppStorage("selectedSortStyle") var selectedStyle = 0

	@AppStorage("updateFavicon") var updateFavicon = false

	// ObservedObject for the LinkViewModel
	@ObservedObject var linkListViewModel: LinkListViewModel

	private func addLink() {
		let link = LinkItem(title: title,
		                    url: CheckURLConventions(urlString: urlString),
		                    isFavourite: false,
		                    parentFolderId: parentFolderViewModel.folder.id!)
		linkListViewModel.add(link)
		notesCreated += 1
		SortList(linkListViewModel: linkListViewModel)
		dismiss()
		updateFavicon.toggle()
	}

	private func addFavouriteLink() {
		let link = LinkItem(title: title,
		                    url: urlString,
		                    isFavourite: true,
		                    parentFolderId: parentFolderViewModel.folder.id!)

		linkListViewModel.add(link)
		notesCreated += 1
		SortList(linkListViewModel: linkListViewModel)
		dismiss()
		updateFavicon.toggle()
	}

	var body: some View {
		VStack {
			Text("Add New Link")
				.font(.title)

			TextField("", text: $title, prompt: Text("title"))
				.font(.title2)
				.textFieldStyle(.roundedBorder)

			TextField("", text: $urlString, prompt: Text("url"))
				.font(.title2)
				.textFieldStyle(.roundedBorder)
				.onSubmit {
					addLink()
				}

			Picker("Folder", selection: $parentFolderViewModel) {
				ForEach(folderListViewModel.folderViewModels, id: \.self) { folderViewModel in
					Text(folderViewModel.folder.name)
				}
			}

			HStack {
				Button {
					addLink()
				} label: {
					Label("Save", systemImage: "tray.and.arrow.down")
				}
				.buttonStyle(SaveButton(colour: Color.accentColor))
				.keyboardShortcut(.defaultAction)

				Button {
					addFavouriteLink()
				} label: {
					Label("Save as Favourite", systemImage: "star")
				}
				.buttonStyle(SaveButton(colour: Color.accentColor))
			}
		}

		.padding()
		.onExitCommand { dismiss() }
	}
}
