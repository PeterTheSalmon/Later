//
//  FolderView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

import Foundation
import SwiftUI

/// Displays the list of links in a respective folder. This code is an absolute disaster.
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
	var showFavouritesOnlyAnimation: Bool

	@Environment(\.isSearching) var isSearching
	@Binding var query: String

	var body: some View {
		if isSearching && !query.isEmpty {
			SearchView(query: $query,
			           listItems: listItems,
			           isShowingNewItemSheet: $isShowingSheet,
			           activeFolderList: activeFolderList,
			           isShowingNewFolderSheet: $isShowingNewFolderSheet)
		} else {
			if !justDeletedFolder { /// this is the normal, almost always used folderView
				VStack {
					let filteredAgain = filteredLinkItems.filter { toFilterItem in
						toFilterItem.parentFolder == parentFolder
					}

					if filteredAgain.count == 0 && !showFavouritesOnly { /// check if there are no items in the folder
						EmptyFolderView()

					} else {
						let numberFavourites = listItems.ItemList.filter { $0.parentFolder == parentFolder && $0.isFavourite }.count

						HStack {
							if numberFavourites > 0 {
								Toggle("Show Favourites Only", isOn: $showFavouritesOnly)
							} else {
								Toggle("Show Favourites Only", isOn: $showFavouritesOnly)
									.disabled(true)
							}
							Spacer().frame(width: 40)

							SortStylePicker()
						}
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
				           value: showFavouritesOnlyAnimation)
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

						ToolbarItem(placement: .navigation) {
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
		PrimaryView(listItems: MockData(), activeFolderList: FolderClass(), isShowingNewItemSheet: .constant(false), isShowingNewFolderSheet: .constant(false))
	}
}
