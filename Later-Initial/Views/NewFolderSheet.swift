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
	
	var body: some View {
		VStack {
			
			HStack {
				Text("Add New Folder")
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
				TextField("Name", text: $name, prompt: Text("folder name"))
					.font(.title2)
					.textFieldStyle(.roundedBorder)
			}
			.padding(.leading)
			.padding(.trailing)
			
			Button {
				activeFolderList.folderList.append(FolderItem(name: name))
				dismiss()
			} label: {
				Label("Save", systemImage: "square.and.arrow.down")
			}
			.buttonStyle(SaveButton(colour: Color.accentColor))
			.padding()
			
		}
		.frame(width: 300, height: 150)
		.onExitCommand { dismiss() }
    }
}

struct NewFolderSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewFolderSheet(activeFolderList: FolderClass())
    }
}
