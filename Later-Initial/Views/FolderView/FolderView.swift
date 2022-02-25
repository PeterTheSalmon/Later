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
	@State var showFavouritesOnly = false
	@Binding var parentFolder: FolderItem
	@Binding var parentFolderViewModel: FolderViewModel
	@Binding var selectedFolder: FolderItem?
	@Binding var selectedFolderViewModel: FolderViewModel?

	@Binding var justDeletedFolder: Bool
	@State private var deleteTimeHasPassed = false

	@Environment(\.isSearching) var isSearching
	@Binding var query: String

	@AppStorage("updateFavicon") var updateFavicon = false

	var body: some View {
		if isSearching && !query.isEmpty {
			SearchView(query: $query,
			           isShowingNewItemSheet: $isShowingSheet,
			           isShowingNewFolderSheet: $isShowingNewFolderSheet,
			           linkListViewModel: linkListViewModel)
		} else {
			if !justDeletedFolder { /// this is the normal, almost always used folderView
				VStack {
					/// Base filtering for the FolderView - by folder only
					let filteredByFolder = linkListViewModel.linkViewModels.filter { linkViewModel in
						linkViewModel.link.parentFolderId == parentFolder.id
					}

					/// Filtering by favourites as well
					let filteredByFavourite = filteredByFolder.filter { linkViewModel in
						linkViewModel.link.isFavourite || linkViewModel.isFakeFavourite
					}

					if filteredByFolder.count == 0 && !showFavouritesOnly { /// check if there are no items in the folder
						EmptyFolderView(folder: selectedFolder)

					} else {
						let numberFavourites = filteredByFavourite.count

						/// Favourites Toggle and SortStylesPicker
						HStack {
							Toggle("Show Favourites Only", isOn: $showFavouritesOnly)
								.disabled(numberFavourites == 0 ? true : false)
								.animation(.linear(duration: Constants().animationDuration), value: numberFavourites)

							Spacer().frame(width: 40)

							SortStylePicker(linkListViewModel: linkListViewModel)
						}
						.padding(.top, 7)

						List {
							ForEach(showFavouritesOnly ? filteredByFavourite : filteredByFolder) { linkViewModel in
								LinkDisplaySheet(linkViewModel: linkViewModel, linkListViewModel: linkListViewModel)
									.swipeActions {
										Button("Delete", role: .destructive) {
											linkViewModel.remove()
										}
									}
							}
						}
					}
				}
				
				.onChange(of: folderListViewModel.needsToReload, perform: { _ in
					/// At this point I freely admit that this method of state management is absolute, pure garbage
					/// Let me explain what is happening:
					/// - When a link is dropped into a folder, the `folderListViewModel.needsToReload` property is toggled, which in turns triggers this `.onChange(_:)` and jankily reloads this view
					return;
				})
				
				.navigationTitle(parentFolderViewModel.folder.name)

				// sets the selected folder to the current parent folder, sorts the list, and fixes the favicons
				.onAppear {
					selectedFolder = parentFolder
					selectedFolderViewModel = parentFolderViewModel
					SortList(linkListViewModel: linkListViewModel)
					Task {
						try await Task.sleep(nanoseconds: 100000000)
						withAnimation(.linear(duration: Constants().animationTime)) {
						updateFavicon.toggle()
						}
					}
				}

				.animation(.linear(duration: Constants().animationDuration),
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
							Image(systemName: Icons().newItem)
						}
						.help("New Item")
					}
				}
				.sheet(isPresented: $isShowingSheet) {
					NewItemSheet(folderListViewModel: folderListViewModel,
					             parentFolderViewModel: selectedFolderViewModel ?? folderListViewModel.folderViewModels[0],
					             linkListViewModel: linkListViewModel)
				}
				.sheet(isPresented: $isShowingNewFolderSheet) {
					NewFolderSheet(folderViewModel: FolderListViewModel(), allowExitCommand: true)
				}
				.frame(minWidth: 400, minHeight: 300)
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
