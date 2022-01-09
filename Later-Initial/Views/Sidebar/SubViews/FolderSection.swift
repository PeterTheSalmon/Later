//
//  FolderSection.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation
import SwiftUI

// MARK: STATUS: Does not work as intended

// Deleting of any folder is allowed as long as there is always one default folder

struct FolderSection: View {
	@ObservedObject var linkListViewModel: LinkListViewModel
	@ObservedObject var folderListViewModel: FolderListViewModel

	@Binding var isShowingNewLinkSheet: Bool
	@Binding var isShowingNewFolderSheet: Bool
	@Binding var showFavouritesOnly: Bool
	@Binding var timesOpened: Int
	@Binding var justDeletedFolder: Bool
	@Binding var selectedFolder: FolderItem?
	@Binding var selectedFolderViewModel: FolderViewModel?

	@Binding var query: String

	@AppStorage("firstFolderActive") var firstFolderActive = false
	@AppStorage("folderManagerActive") var folderManagerActive = false

	var body: some View {
		Section(header: Text("Folders")) {
			
			/// If there is one item, display it
			if folderListViewModel.folderViewModels.indices.contains(0) {
				NavigationLink(
					destination: FolderView(
						linkListViewModel: linkListViewModel,
						folderListViewModel: folderListViewModel,
						isShowingSheet: $isShowingNewLinkSheet,
						isShowingNewFolderSheet: $isShowingNewFolderSheet,
						parentFolder: $folderListViewModel.folderViewModels[0].folder,
						parentFolderViewModel: $folderListViewModel.folderViewModels[0],
						selectedFolder: $selectedFolder,
						selectedFolderViewModel: $selectedFolderViewModel,
						justDeletedFolder: $justDeletedFolder,
						query: $query
					), isActive: $firstFolderActive
				) {
					// This is what is displayed in the sidebar
					SidebarFolderItemView(name: $folderListViewModel.folderViewModels[0].folder.name,
					                      justDeletedFolder: $justDeletedFolder,
					                      folderViewModel: $folderListViewModel.folderViewModels[0],
					                      folderListViewModel: folderListViewModel,
					                      selectedFolder: $selectedFolder)
				}
			}

			/// If only indexes 1 and 2 exist, just display 1 (above) and 2 (here)
			if folderListViewModel.folderViewModels.indices.contains(1) && !folderListViewModel.folderRepository.folders.indices.contains(2) {
				NavigationLink(
					destination: FolderView(
						linkListViewModel: linkListViewModel,
						folderListViewModel: folderListViewModel,
						isShowingSheet: $isShowingNewLinkSheet,
						isShowingNewFolderSheet: $isShowingNewFolderSheet,
						parentFolder: $folderListViewModel.folderViewModels[1].folder,
						parentFolderViewModel: $folderListViewModel.folderViewModels[1],
						selectedFolder: $selectedFolder,
						selectedFolderViewModel: $selectedFolderViewModel,
						justDeletedFolder: $justDeletedFolder,
						query: $query
					)) {
						// This is what is displayed in the sidebar
						SidebarFolderItemView(name: $folderListViewModel.folderViewModels[1].folder.name,
						                      justDeletedFolder: $justDeletedFolder,
						                      folderViewModel: $folderListViewModel.folderViewModels[1],
						                      folderListViewModel: folderListViewModel,
						                      selectedFolder: $selectedFolder)
					}

				/// If at least 3 items exist, display index 0 up top and then the rest in a for-each
			} else if folderListViewModel.folderViewModels.indices.contains(1) && folderListViewModel.folderRepository.folders.indices.contains(2) {
				ForEach($folderListViewModel.folderViewModels[1 ... folderListViewModel.folderViewModels.count - 1]) { folder in
					NavigationLink(
						destination: FolderView(
							linkListViewModel: linkListViewModel,
							folderListViewModel: folderListViewModel,
							isShowingSheet: $isShowingNewLinkSheet,
							isShowingNewFolderSheet: $isShowingNewFolderSheet,
							parentFolder: folder.folder,
							parentFolderViewModel: folder,
							selectedFolder: $selectedFolder,
							selectedFolderViewModel: $selectedFolderViewModel,
							justDeletedFolder: $justDeletedFolder,
							query: $query
						)) {
							// This is what is displayed in the sidebar
							SidebarFolderItemView(name: folder.folder.name,
							                      justDeletedFolder: $justDeletedFolder,
							                      folderViewModel: folder,
							                      folderListViewModel: folderListViewModel,
							                      selectedFolder: $selectedFolder)
						}
				}
			}
		}
		
		NavigationLink(destination: FolderManagerView(folderListViewModel: folderListViewModel, linkListViewModel: linkListViewModel, isShowingNewItemSheet: $isShowingNewLinkSheet, query: $query), isActive: $folderManagerActive) {
			SidebarExtraItemView(name: "Manage Folders", imageName: "gear")
		}
		
	}
}
