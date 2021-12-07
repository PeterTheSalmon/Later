//
//  ContentView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-10-30.
//

import SwiftUI

struct PrimaryView: View {
	@StateObject var listItems = MockData()
	@StateObject var activeFolderList = FolderClass()
	@Binding var isShowingNewItemSheet: Bool
	@State private var showFavouritesOnly = false
	@Binding var isShowingNewFolderSheet: Bool
	@State var justDeletedFolder = false
	@State var selectedFolder: FolderItem?
	@AppStorage("timesOpened") var timesOpened = 0
	@State var query: String = ""
	@Environment(\.isSearching) var isSearching
	@AppStorage("introSeen") var newUser = true
	@Environment(\.dismiss) var dismiss

	var filteredLinkItems: [LinkItem] {
		listItems.ItemList.filter { item in
			!showFavouritesOnly || item.isFavourite
		}
	}

	var body: some View {
		NavigationView {
			Sidebar(listItems: listItems,
			        activeFolderList: activeFolderList,
			        isShowingSheet: $isShowingNewItemSheet,
			        isShowingNewFolderSheet: $isShowingNewFolderSheet,
			        showFavouritesOnly: $showFavouritesOnly,
			        timesOpened: $timesOpened,
			        justDeletedFolder: $justDeletedFolder,
			        selectedFolder: $selectedFolder,
			        filteredLinkItems: filteredLinkItems, query: $query)

			NoFolderSelectedView(query: $query, listItems: listItems, isShowingSheet: $isShowingNewItemSheet, activeFolderList: activeFolderList, isShowingNewFolderSheet: $isShowingNewFolderSheet)
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
					NewItemSheet(listItems: listItems, activeFolderList: activeFolderList, parentFolder: activeFolderList.folderList[0])
				}
				.sheet(isPresented: $isShowingNewFolderSheet) {
					NewFolderSheet(activeFolderList: activeFolderList)
				}
		}
		.sheet(isPresented: $newUser) {
			WelcomeScreen(newUserValue: $newUser)
		}
		.onAppear {
			timesOpened += 1
			print(timesOpened)
		}
		.searchable(text: $query, prompt: Text("Search..."))
	}

	private func toggleSidebar() {
		NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
	}
}
