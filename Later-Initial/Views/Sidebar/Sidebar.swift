//
//  Sidebar.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-10-30.
//

import SwiftUI

struct Sidebar: View {
	@ObservedObject var linkListViewModel: LinkListViewModel
	@ObservedObject var folderListViewModel: FolderListViewModel

	@Binding var isShowingSheet: Bool
	@Binding var isShowingNewFolderSheet: Bool
	@Binding var showFavouritesOnly: Bool
	@Binding var timesOpened: Int
	@Binding var justDeletedFolder: Bool
	@Binding var selectedFolder: FolderItem?

	// var filteredLinkItems: [LinkItem]
	@Binding var query: String
	@State var noFolderViewSelected = true

	var body: some View {
		VStack {
			List {
				NavigationLink(destination: NoFolderSelectedView(folderListViewModel: folderListViewModel,
																												 linkListViewModel: linkListViewModel,
																												 selectedFolder: $selectedFolder,
				                                                 query: $query,
				                                                 isShowingSheet: $isShowingSheet,
				                                                 isShowingNewFolderSheet: $isShowingNewFolderSheet), isActive: $noFolderViewSelected) {
					SidebarExtraItemView(name: "Home", imageName: "house.fill")
				}

				FolderSection(
					linkListViewModel: linkListViewModel,
					folderListViewModel: folderListViewModel,
					isShowingNewLinkSheet: $isShowingSheet,
					isShowingNewFolderSheet: $isShowingNewFolderSheet,
					showFavouritesOnly: $showFavouritesOnly,
					timesOpened: $timesOpened,
					justDeletedFolder: $justDeletedFolder,
					selectedFolder: $selectedFolder,
					query: $query
				)

				// MARK: This section, containing only the about view, should be unaffected by the Firebase changes

				MoreSection(folderListViewModel: folderListViewModel,
				            linkListViewModel: linkListViewModel,
				            selectedFolder: $selectedFolder,
				            timesOpened: $timesOpened,
				            isShowingNewFolderSheet: $isShowingNewFolderSheet,
				            isShowingSheet: $isShowingSheet,
				            query: $query,
				            justDeletedFolder: $justDeletedFolder)
			}
			.listStyle(.sidebar)
			.listItemTint(Color.accentColor)

			Divider()
				.padding(0)

			NewFolderButton(isShowingNewFolderSheet: $isShowingNewFolderSheet)
		}
	}
}
