//
//  FolderView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

import Foundation
import SwiftUI

// Displays the list of links in a respective folder. This code is an absolute disaster.
struct FolderView: View {
	@ObservedObject var linkListViewModel: LinkListViewModel
	@ObservedObject var folderListViewModel: FolderListViewModel

	@Binding var isShowingSheet: Bool
	@Binding var isShowingNewFolderSheet: Bool
	@Binding var showFavouritesOnly: Bool
	@Binding var parentFolder: FolderItem
	@Binding var selectedFolder: FolderItem?

	@Binding var justDeletedFolder: Bool
	@State private var deleteTimeHasPassed = false

	@Environment(\.isSearching) var isSearching
	@Binding var query: String

	var body: some View {
		if isSearching && !query.isEmpty {
			SearchView(query: $query,
			           isShowingNewItemSheet: $isShowingSheet,
			           isShowingNewFolderSheet: $isShowingNewFolderSheet)
		} else {
			if !justDeletedFolder { /// this is the normal, almost always used folderView
				VStack {
					/// Base filtering for the FolderView - by folder only
					let filteredByFolder = linkListViewModel.linkViewModels.filter { linkViewModel in
						linkViewModel.link.parentFolderId == parentFolder.id
					}

					/// Filtering by favourites as well
					let filteredByFavourite = filteredByFolder.filter { linkViewModel in
						linkViewModel.link.isFavourite
					}

					if filteredByFolder.count == 0 && !showFavouritesOnly { /// check if there are no items in the folder
						EmptyFolderView(folder: selectedFolder)

					} else {
						let numberFavourites = filteredByFavourite.count

						/// Favourites Toggle and SortStylesPicker
						HStack {
							if numberFavourites > 0 {
								Toggle("Show Favourites Only", isOn: $showFavouritesOnly)
							} else {
								Toggle("Show Favourites Only", isOn: $showFavouritesOnly)
									.disabled(true)
							}
							Spacer().frame(width: 40)

							// SortStylePicker(listItems: listItems)
							Text("sort style picker goes here")
						}
						.padding(.top, 7)

						List {
							ForEach(showFavouritesOnly ? filteredByFavourite : filteredByFolder) { linkViewModel in
								LinkDisplaySheet(linkViewModel: linkViewModel)
							}
							// TODO: .onDelete()
						}
					}
				}
				// sets the selected folder to the current parent folder
				.onAppear {
					selectedFolder = parentFolder
				}
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
					NewItemSheet(folderListViewModel: folderListViewModel,
											 parentFolderViewModel: folderListViewModel.folderViewModels[0], selectedFolder: $selectedFolder,
					             linkListViewModel: linkListViewModel)
				}
				.sheet(isPresented: $isShowingNewFolderSheet) {
					NewFolderSheet(folderViewModel: FolderListViewModel(), allowExitCommand: true)
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
						NewItemSheet(folderListViewModel: folderListViewModel,
												 parentFolderViewModel: folderListViewModel.folderViewModels[0],
						             selectedFolder: $selectedFolder,
						             linkListViewModel: linkListViewModel)
					}
					.sheet(isPresented: $isShowingNewFolderSheet) {
						NewFolderSheet(folderViewModel: FolderListViewModel(), allowExitCommand: true)
					}
			}
		}
	}

	private func toggleSidebar() {
		NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
	}
}

struct FolderView_Previews: PreviewProvider {
	static var previews: some View {
		Text("Blank")
		// TODO: Fix preview
	}
}
