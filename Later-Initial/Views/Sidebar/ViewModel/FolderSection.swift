//
//  FolderSection.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation
import SwiftUI

struct FolderSection: View {
	@ObservedObject var linkListViewModel: LinkListViewModel
	@ObservedObject var folderListViewModel: FolderListViewModel
	
	@Binding var isShowingNewLinkSheet: Bool
	@Binding var isShowingNewFolderSheet: Bool
	@Binding var showFavouritesOnly: Bool
	@Binding var timesOpened: Int
	@Binding var justDeletedFolder: Bool
	@Binding var selectedFolder: FolderItem?

	@Binding var query: String

	var body: some View {
		Section(header: Text("Folders")) {
			ForEach($folderListViewModel.folderViewModels) { folder in
			NavigationLink(
				destination: FolderView(
					linkListViewModel: linkListViewModel,
					folderListViewModel: folderListViewModel,
					isShowingSheet: $isShowingNewLinkSheet,
					isShowingNewFolderSheet: $isShowingNewFolderSheet,
					showFavouritesOnly: $showFavouritesOnly,
					parentFolder: folder.folder,
					selectedFolder: $selectedFolder,
					justDeletedFolder: $justDeletedFolder,
					showFavouritesOnlyAnimation: showFavouritesOnly,
					query: $query
				)) {
					// This is what is displayed in the sidebar
					SidebarFolderItemView(name: folder.folder.name,
					                      justDeletedFolder: $justDeletedFolder,
																item: folder.folder,
					                      selectedFolder: $selectedFolder)
				}
			 }
		}
		.onAppear {
			print("SELECTED FOLDER IS \(String(describing: selectedFolder))")
		}
	}
}
