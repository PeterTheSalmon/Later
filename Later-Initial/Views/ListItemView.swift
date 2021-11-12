//
//  ListItemView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

/// this file has two views - one for the standard list item for folders, and one for other items contained in the "more" header

import SwiftUI

struct ListItemView: View {
	@Binding var name: String
	@State private var isHoveringTrash = false
	@ObservedObject var activeFolderList: FolderClass
	@ObservedObject var listItems: MockData

	@Binding var justDeletedFolder: Bool
	@Binding var item: FolderItem
	@Binding var selectedFolder: FolderItem?
	
	@State var deleteFolderAlertPresented = false
	
	var itemIndex: Int? {
		activeFolderList.folderList.firstIndex(where: { $0.id == item.id }) ?? nil
	}
	
	var body: some View {
		HStack {
			Image(systemName: "folder.fill")
			
			Text(name)
			
			Spacer()
			
			/// trash icon to delete items
			
			if item.name != "Uncategorized" || activeFolderList.folderList.filter { $0.name == "Uncategorized" }.count >= 2 {
				Image(systemName: "trash")
					.opacity(isHoveringTrash ? 100 : 0)
					.onTapGesture {
						if (itemIndex != nil && item.name != "Uncategorized") ||
							(itemIndex != nil && activeFolderList.folderList.filter { $0.name == "Uncategorized" }.count >= 2)
						{
							if selectedFolder == item {
								justDeletedFolder = true
							}
							listItems.ItemList.removeAll(where: { $0.parentFolder == item })
							activeFolderList.folderList.remove(at: itemIndex!)
							
						} else {
							deleteFolderAlertPresented = true
						}
					}
					.alert(isPresented: $deleteFolderAlertPresented) {
						Alert(title: Text("Don't do this..."), message: Text("You really don't want to delete this folder!"))
					}
			}
		}
		.onHover { hovering in
			isHoveringTrash = hovering
		}
	}
}

struct moreItemView: View {
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
//		ListItemView(name: .constant("Test"), activeFolderList: FolderClass())
//    }
// }
