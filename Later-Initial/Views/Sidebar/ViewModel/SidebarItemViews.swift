//
//  ListItemView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

/// this file has two views - one for the standard list item for folders, and one for other items contained in the "more" header

import SwiftUI

struct SidebarFolderItemView: View {
	@Binding var name: String
	@State private var isHoveringTrash = false
	@ObservedObject var activeFolderList: FolderClass
	@ObservedObject var listItems: LinkItems

	@Binding var justDeletedFolder: Bool
	@Binding var item: FolderItem
	@Binding var selectedFolder: FolderItem?

	@State private var deleteAlertPresented = false // this is for deleting
	@State private var editPopoverPresented = false
	@State private var folderColour = Color.primary

	// If true, folders are deleted in one click
	@AppStorage("instantDeleteFolder") var instantDeleteFolder = false

	var itemIndex: Int? {
		activeFolderList.folderList.firstIndex(where: { $0.id == item.id }) ?? nil
	}

	func deleteFolder() {
		if (itemIndex != nil && item.name != "Uncategorized") ||
			(itemIndex != nil && activeFolderList.folderList.filter { $0.name == "Uncategorized" }.count >= 2)
		{
			if selectedFolder == activeFolderList.folderList[itemIndex!] {
				justDeletedFolder = true
			}

			listItems.ItemList.removeAll(where: { $0.parentFolder == item })
			activeFolderList.folderList.remove(at: itemIndex!)
		}
	}

	var body: some View {
		HStack {
			Image(systemName: "folder.fill")
				.foregroundColor(item.colour ?? nil)

			Text(name)

			Spacer()

			// trash icon to delete items, on the condition that the folder isn't the default uncategorized one

			Image(systemName: "pencil")
				.opacity(isHoveringTrash ? 100 : 0)
				.onTapGesture {
					editPopoverPresented = true
				}

			if item.name != "Uncategorized" || activeFolderList.folderList.filter { $0.name == "Uncategorized" }.count >= 2 {
				Image(systemName: "trash")
					.opacity(isHoveringTrash ? 100 : 0)
					.onTapGesture {
						if instantDeleteFolder { deleteFolder() } else { deleteAlertPresented = true }
					}
			}
		} // *HStack
		/// if the folder colour isn't set to default (Color.primary), adjust the folderColour state to reflect this colour
		.onAppear { if item.colour != nil { folderColour = item.colour! } }
		
		/// popover for editing folder values
		.popover(isPresented: $editPopoverPresented, arrowEdge: .trailing) {
			VStack {
				ColorPicker("Folder Colour", selection: $folderColour, supportsOpacity: false)
				Button("Save") {
					item.colour = folderColour
					editPopoverPresented = false
				}.keyboardShortcut(.defaultAction)

			}.padding()
		}
		
		/// hover check to see if buttons should have opacity or not
		.onHover { hovering in
			isHoveringTrash = hovering
		}
		
		/// alert before deleting items - if one-click deletions are on from preferences this won't show
		.alert("Delete \"\(item.name)\"?\n All items in the folder will be deleted.", isPresented: $deleteAlertPresented) {
			Button("Delete", role: .destructive) {
				deleteFolder()
			}
			.keyboardShortcut(.defaultAction)
		}
	}
}

struct SidebarExtraItemView: View {
	var name: String
	var imageName: String

	var body: some View {
		HStack {
			Image(systemName: imageName)
			Text(name)
			Spacer()
		}
	}
}

// struct ListItemView_Previews: PreviewProvider {
//
//	static var previews: some View {
//		SidebarFolderItemView(name: .constant("Test"), activeFolderList: FolderClass())
//    }
// }
