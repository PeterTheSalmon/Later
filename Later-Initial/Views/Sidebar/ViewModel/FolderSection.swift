//
//  FolderSection.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation
import SwiftUI

struct FolderSection: View {
	
	@ObservedObject var listItems: MockData
	@ObservedObject var activeFolderList: FolderClass
	@Binding var isShowingSheet: Bool
	@Binding var isShowingNewFolderSheet: Bool
	@Binding var showFavouritesOnly: Bool
	@Binding var timesOpened: Int
	@Binding var justDeletedFolder: Bool
	@Binding var selectedFolder: FolderItem?
	
	var filteredLinkItems: [LinkItem]
	
	@Binding var query: String
	
	var body: some View {
		Section(header: Text("Folders")) {
			ForEach($activeFolderList.folderList) { folder in
				NavigationLink(
					destination: FolderView(listItems: listItems,
											activeFolderList: activeFolderList,
											isShowingSheet: $isShowingSheet,
											isShowingNewFolderSheet: $isShowingNewFolderSheet,
											showFavouritesOnly: $showFavouritesOnly,
											parentFolder: folder,
											selectedFolder: $selectedFolder,
											justDeletedFolder: $justDeletedFolder,
											filteredLinkItems: filteredLinkItems,
											showFavouritesOnlyAnimation: showFavouritesOnly, query: $query)) {
												SidebarFolderItemView(name: folder.name,
																	  activeFolderList: activeFolderList,
																	  listItems: listItems,
																	  justDeletedFolder: $justDeletedFolder,
																	  item: folder,
																	  selectedFolder: $selectedFolder)
											}
			}
		}
	}
}

