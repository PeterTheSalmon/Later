//
//  Sidebar.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-10-30.
//

import SwiftUI

struct Sidebar: View {
	
	@ObservedObject var listItems: MockData
	@ObservedObject var activeFolderList: FolderClass
	@Binding var isShowingSheet: Bool
	@Binding var isShowingNewFolderSheet: Bool
	@Binding var showFavouritesOnly: Bool
		
	var filteredLinkItems: [LinkItem]
	
	var body: some View {
		
		
		VStack {
			List {
				Section(header: Text("Folders")) {
					ForEach($activeFolderList.folderList) { folder in
						NavigationLink(
							destination: FolderView(listItems: listItems,
													activeFolderList: activeFolderList,
													isShowingSheet: $isShowingSheet,
													isShowingNewFolderSheet: $isShowingNewFolderSheet,
													showFavouritesOnly: $showFavouritesOnly,
													parentFolder: folder,
													filteredLinkItems: filteredLinkItems)) {
														
														ListItemView(name: folder.name, activeFolderList: activeFolderList, item: folder)
													
													}
					}
				}
			}
			.listStyle(.sidebar)
			.listItemTint(Color.accentColor)
			
			Divider()
				.padding(0)
			
			HStack {
				
				Button {
					isShowingNewFolderSheet = true
				} label: {
					Label("New Folder", systemImage: "folder.badge.plus")
				}
				.buttonStyle(.borderless)
				
				Spacer()
			}
			.padding(.leading)
			.padding(.bottom, 10)
		}
	}
}



//struct Sidebar_Previews: PreviewProvider {
//
//
//	static var previews: some View {
//		Sidebar(listItems: MockData(), activeFolderList: FolderClass(), isShowingSheet: .constant(false), isShowingNewFolderSheet: .constant(false), showFavouritesOnly: .constant(false), filteredLinkItems: filteredLinkItems)
//	}
//}
