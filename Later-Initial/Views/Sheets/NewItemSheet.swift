//
//  NewItemSheet.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-07.
//
import SwiftUI

struct NewItemSheet: View {
	@ObservedObject var listItems: MockData
	@ObservedObject var activeFolderList: FolderClass
	@Environment(\.dismiss) var dismiss
	
	@State private var title = ""
	@State private var urlString = ""
	@State private var isFavourite = false
	@State var parentFolder: FolderItem
	
	var body: some View {
		VStack(spacing: 0) {
			HStack {
				Text("Add New Item")
					.font(.title)
					.padding()
				
				Spacer()
				
				Button {
					dismiss()
					
				} label: {
					Label("Cancel", systemImage: "xmark.circle")
						.font(.title3)
				}
				.buttonStyle(.borderless)
				.padding()
			}
			
			Form {
				TextField("Title", text: $title, prompt: Text("Title"))
					.font(.title2)
				
				TextField("URL", text: $urlString, prompt: Text("URL"))
					.font(.title3)
					.onSubmit {
						let item = LinkItem(title: title,
											url: checkURLconventions(urlString: urlString),
											parentFolder: parentFolder)
						listItems.ItemList.append(item)
						dismiss()
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
					let item = LinkItem(title: title,
										url: checkURLconventions(urlString: urlString),
										parentFolder: parentFolder)
					listItems.ItemList.append(item)
					dismiss()
				} label: {
					Label("Save", systemImage: "square.and.arrow.down")
				}
				.buttonStyle(SaveButton(colour: Color.accentColor))
				.keyboardShortcut(.defaultAction)
				
				
				Button { // save as fave
					let item = LinkItem(title: title,
										url: checkURLconventions(urlString: urlString),
										isFavourite: true,
										parentFolder: parentFolder)
					listItems.ItemList.append(item)
					dismiss()
				} label: {
					Label("Save as Favourite", systemImage: "star")
				}
				.buttonStyle(SaveButton(colour: Color.accentColor))
			}
			.padding(.bottom)
		}
		.frame(width: 400, height: 200)
		.onExitCommand { dismiss() }
	}
}

struct NewItemSheet_Previews: PreviewProvider {
	static var previews: some View {
		NewItemSheet(listItems: MockData(), activeFolderList: FolderClass(), parentFolder: FolderItem(name: "Preview"))
	}
}