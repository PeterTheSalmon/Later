//
//  Sidebar.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-10-30.
//

import SwiftUI

// FIXME: when in fullscreen with the sidebar collapsed, moving cursor to the left edge for the slideout sidebar and clicking a folder crashes the app

struct Sidebar: View {
	@ObservedObject var listItems: MockData
	@ObservedObject var activeFolderList: FolderClass
	@Binding var isShowingSheet: Bool
	@Binding var isShowingNewFolderSheet: Bool
	@Binding var showFavouritesOnly: Bool
	@Binding var timesOpened: Int
	@Binding var justDeletedFolder: Bool
	@Binding var selectedFolder: FolderItem?

	var filteredLinkItems: [LinkItem]

	var body: some View {
		VStack {
			List {
				FolderSection(listItems: listItems, activeFolderList: activeFolderList, isShowingSheet: $isShowingSheet, isShowingNewFolderSheet: $isShowingNewFolderSheet, showFavouritesOnly: $showFavouritesOnly, timesOpened: $timesOpened, justDeletedFolder: $justDeletedFolder, selectedFolder: $selectedFolder, filteredLinkItems: filteredLinkItems)

				MoreSection(timesOpened: $timesOpened, activeFolderList: activeFolderList, isShowingNewFolderSheet: $isShowingNewFolderSheet, isShowingSheet: $isShowingSheet, listItems: listItems)
			}
			.listStyle(.sidebar)
			.listItemTint(Color.accentColor)

			Divider()
				.padding(0)

			NewFolderButton(isShowingNewFolderSheet: $isShowingNewFolderSheet)
		}
	}
}


