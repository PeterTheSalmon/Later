//
//  FolderView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

import Foundation
import SwiftUI

struct FolderView: View {
	
	@ObservedObject var listItems: MockData
	@ObservedObject var activeFolderList: FolderClass
	@Binding var isShowingSheet: Bool
	@Binding var isShowingNewFolderSheet: Bool
	@Binding var showFavouritesOnly: Bool
	@Binding var parentFolder: FolderItem
	
	@Binding var selectedFolder: FolderItem?
	@Binding var justDeletedFolder: Bool
	
	var filteredLinkItems: [LinkItem]
	
	var body: some View {
		
		if !justDeletedFolder { /// this is the normal, almost always used folderview
			VStack {
				
				let filteredAgain = filteredLinkItems.filter { toFilterItem in
					return toFilterItem.parentFolder == parentFolder
				}
				
				if filteredAgain.count == 0 && !showFavouritesOnly {
					
					EmptyListView()
					
				} else {
					
					Toggle("Show Favourites Only", isOn: $showFavouritesOnly)
						.toggleStyle(.switch)
						.padding(.top, 7)
					
					
					List {
						
						ForEach(filteredAgain) { item in
							LinkDisplaySheet(item: item,
											 listItems: listItems)
						}
						.onDelete(perform: removeItems)
					}
				}
				
			}
			.onAppear {
				selectedFolder = parentFolder
			}
			.animation(.linear(duration: 0.1),
					   value: listItems.ItemList.count)
			.animation(.linear(duration: 0.1),
					   value: showFavouritesOnly)
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
			.sheet(isPresented: $isShowingSheet) {
				NewItemSheet(listItems: listItems, activeFolderList: activeFolderList, parentFolder: selectedFolder ?? activeFolderList.folderList[0])
			}
			.sheet(isPresented: $isShowingNewFolderSheet) {
				NewFolderSheet(activeFolderList: activeFolderList)
			}
			.frame(minWidth: 400, minHeight: 300)
		
		} else if justDeletedFolder { /// for the rare case in which a user deletes a folder that they currently have selected
			FolderDeletedView()
				.navigationTitle("Later")
				.onDisappear {
					justDeletedFolder = false
				}
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
				.sheet(isPresented: $isShowingSheet) {
					NewItemSheet(listItems: listItems, activeFolderList: activeFolderList, parentFolder: activeFolderList.folderList[0])
				}
				.sheet(isPresented: $isShowingNewFolderSheet) {
					NewFolderSheet(activeFolderList: activeFolderList)
				}
		}
		
		
		
	}
	
	func removeItems(at offsets: IndexSet) {
		listItems.ItemList.remove(atOffsets: offsets)
	}
	
	private func toggleSidebar() {
		NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		PrimaryView(listItems: MockData(), activeFolderList: FolderClass(), isShowingNewFolderSheet: false)
	}
}
