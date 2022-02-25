//
//  FolderSection.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

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

	@AppStorage("folderManagerActive") var folderManagerActive = false

	var body: some View {
		Section(header: Text("Folders")) {
			ForEach($folderListViewModel.folderViewModels) { folder in
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
					).searchable(text: $query)
				) {
					// This is what is displayed in the sidebar
					SidebarFolderItemView(name: folder.folder.name,
					                      justDeletedFolder: $justDeletedFolder,
					                      folderViewModel: folder,
					                      folderListViewModel: folderListViewModel,
					                      selectedFolder: $selectedFolder)
						.onDrop(
							of: [UTType.text],
							delegate: ProjectDropDelegate(
								linkViewModel: linkListViewModel.draggedLinkViewModel,
								folder: folder
							)
						)
				}
			}
		}

		NavigationLink(destination: FolderManagerView(folderListViewModel: folderListViewModel, linkListViewModel: linkListViewModel, isShowingNewItemSheet: $isShowingNewLinkSheet, query: $query), isActive: $folderManagerActive) {
			SidebarExtraItemView(name: "Manage Folders", imageName: Icons().gear)
		}
	}
}
