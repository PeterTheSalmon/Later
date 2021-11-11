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
	@State private var isShowingSheet = false
	@State private var showFavouritesOnly = false
	@State var isShowingNewFolderSheet = false
	
	var filteredLinkItems: [LinkItem] {
		listItems.ItemList.filter { item in
			(!showFavouritesOnly || item.isFavourite)
		}
	}
	
	var body: some View {
		NavigationView {
			
			Sidebar(listItems: listItems,
					activeFolderList: activeFolderList,
					isShowingSheet: $isShowingSheet,
					isShowingNewFolderSheet: $isShowingNewFolderSheet,
				   showFavouritesOnly: $showFavouritesOnly,
				   filteredLinkItems: filteredLinkItems)
			
			NoFolderSelectedView()
				.navigationTitle("Later")
				.toolbar {
					ToolbarItem(placement: .navigation) {
						Button {
							toggleSidebar()
						} label: {
							Image(systemName: "sidebar.left")
						}
					}
					
					ToolbarItem {
						Button {
							isShowingSheet = true
						} label: {
							Image(systemName: "plus.circle.fill")
						}
						.help("New Item")
					}
					
					
				}
			
// changes start here
				.sheet(isPresented: $isShowingSheet) {
					NewItemSheet(listItems: listItems, activeFolderList: activeFolderList, parentFolder: activeFolderList.folderList[0])
				}
				.sheet(isPresented: $isShowingNewFolderSheet) {
					NewFolderSheet(activeFolderList: activeFolderList)
				}
		}
    }
	
	private func toggleSidebar() {
		NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
	}
}

