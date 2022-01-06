//
//  ContentView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-10-30.
//

import SwiftUI

struct PrimaryView: View {
	@ObservedObject var linkListViewModel = LinkListViewModel()
	@ObservedObject var folderListViewModel = FolderListViewModel()

	@AppStorage("FolderListEmpty") var folderListIsEmpty = false
	
	@Binding var isShowingNewItemSheet: Bool
	@State private var showFavouritesOnly = false
	@Binding var isShowingNewFolderSheet: Bool
	@State var justDeletedFolder = false

	// selectedFolder is changed in FolderView.swift
	@State var selectedFolder: FolderItem?
	@AppStorage("timesOpened") var timesOpened = 0

	// Query for searching
	@State var query: String = ""
	@Environment(\.isSearching) var isSearching
	@AppStorage("introSeen") var newUser = true
	@Environment(\.dismiss) var dismiss

	// TODO: item filtering for favourites
	// Here is the old implementation
	//	var filteredLinkItems: [LinkItem] {
	//		listItems.ItemList.filter { item in
	//			!showFavouritesOnly || item.isFavourite
	//		}
	//	}

	var body: some View {
		NavigationView {
			Sidebar(
				linkListViewModel: linkListViewModel,
				folderListViewModel: folderListViewModel,
				isShowingSheet: $isShowingNewItemSheet,
				isShowingNewFolderSheet: $isShowingNewFolderSheet,
				showFavouritesOnly: $showFavouritesOnly,
				timesOpened: $timesOpened,
				justDeletedFolder: $justDeletedFolder,
				selectedFolder: $selectedFolder,
				query: $query
			)

			NoFolderSelectedView(query: $query,
			                     isShowingSheet: $isShowingNewItemSheet,
			                     isShowingNewFolderSheet: $isShowingNewFolderSheet)
				.navigationTitle("Later")
				.toolbar {
					ToolbarItem(placement: .navigation) {
						Button {
							toggleSidebar()
						} label: {
							Image(systemName: "sidebar.left")
						}
					}

					ToolbarItem(placement: .navigation) {
						Button {
							isShowingNewItemSheet = true
						} label: {
							Image(systemName: "plus.circle.fill")
						}
						.help("New Item")
					}
				}

				.sheet(isPresented: $isShowingNewItemSheet) {
					NewItemSheet(folderListViewModel: folderListViewModel,
											 selectedFolder: $selectedFolder,
											 linkListViewModel: linkListViewModel)
				}
				.sheet(isPresented: $isShowingNewFolderSheet) {
					NewFolderSheet(folderViewModel: FolderListViewModel(), allowExitCommand: true)
				}
		}

		.sheet(isPresented: $newUser) {
			WelcomeScreen(newUserValue: $newUser)
		}
		
		.sheet(isPresented: $folderListIsEmpty) {
			NewFolderSheet(folderViewModel: folderListViewModel, allowExitCommand: false)
		}
		
		.onAppear {
			timesOpened += 1
			print(timesOpened)
			print(Date.now)
		}
		.searchable(text: $query, prompt: Text("Search..."))
	}

	private func toggleSidebar() {
		NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
	}
}
