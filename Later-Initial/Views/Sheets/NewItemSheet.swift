//
//  NewItemSheet.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-07.
//
import SwiftUI

struct NewItemSheet: View {
	@ObservedObject var listItems: LinkItems
	@ObservedObject var activeFolderList: FolderClass
	@Environment(\.dismiss) var dismiss

	@State private var title = ""
	@State private var urlString = ""
	@State private var isFavourite = false
	@State var parentFolder: FolderItem

	@AppStorage("notesCreated") var notesCreated = 0
	
	private func submitNote() {
		let item = LinkItem(title: title,
							url: checkURLconventions(urlString: urlString),
							parentFolder: parentFolder)
		listItems.ItemList.append(item)
		notesCreated += 1
		dismiss()
	}
	private func submitFaveNote() {
		let item = LinkItem(title: title,
							url: checkURLconventions(urlString: urlString),
							parentFolder: parentFolder)
		listItems.ItemList.append(item)
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
						submitNote()
					}

				Picker("Folder", selection: $parentFolder) {
					ForEach(activeFolderList.folderList, id: \.self) { folder in
						Text(folder.name)
					}
				}
				.font(.title3)
			}
			.textFieldStyle(.roundedBorder)
			.padding(.leading)
			.padding(.trailing)
			.padding(.bottom)

			HStack {
				Button { // save normally
					submitNote()
				} label: {
					Label("Save", systemImage: "tray.and.arrow.down")
				}
				.buttonStyle(SaveButton(colour: Color.accentColor))
				.keyboardShortcut(.defaultAction)

				Button { // save as fave
					submitFaveNote()
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
		NewItemSheet(listItems: LinkItems(), activeFolderList: FolderClass(), parentFolder: FolderItem(name: "Preview"))
	}
}
