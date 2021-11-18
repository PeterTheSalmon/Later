//
//  NewFolderSheet.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

import SwiftUI

struct NewFolderSheet: View {
	@Environment(\.dismiss) var dismiss
	@State private var name = ""
	@ObservedObject var activeFolderList: FolderClass
	@State var isPressed = false

	var body: some View {
		VStack {
			Label("Add New Folder", systemImage: "folder.badge.plus")
				.font(.title)
			
			Form {
				TextField("", text: $name, prompt: Text("Name"))
					.font(.title3)
					.onSubmit {
						activeFolderList.folderList.append(FolderItem(name: name))
						dismiss()
					}
			}
			.textFieldStyle(.roundedBorder)
			
			
			HStack {
				Button { // save normally
					activeFolderList.folderList.append(FolderItem(name: name))
					dismiss()
				} label: {
					Label("Save", systemImage: "tray.and.arrow.down")
				}
				.buttonStyle(SaveButton(colour: Color.accentColor))
				.keyboardShortcut(.defaultAction)
			}
			.padding(.top, 6)
		}
		.padding()
		.frame(width: 300, height: 135)
		.onExitCommand { dismiss() }
	}
}

struct NewFolderSheet_Previews: PreviewProvider {
	
	
	static var previews: some View {
		NewFolderSheet(activeFolderList: FolderClass())
	}
}
