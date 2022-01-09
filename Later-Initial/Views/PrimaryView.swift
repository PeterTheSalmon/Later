//
//  ContentView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-10-30.
//

import SwiftUI

/// Serves as host for main NavigationView
///
/// PrimaryView contains most App States and Objects. These are then passed to subviews.
struct PrimaryView: View {
	@ObservedObject var linkListViewModel = LinkListViewModel()
	@ObservedObject var folderListViewModel = FolderListViewModel()

	@AppStorage("FolderListEmpty") var folderListIsEmpty = false

	@Binding var isShowingNewItemSheet: Bool
	@State private var showFavouritesOnly = false
	@Binding var isShowingNewFolderSheet: Bool
	@State var justDeletedFolder = false

	// selectedFolder/viewModel are changed in FolderView.swift
	@State var selectedFolder: FolderItem?
	@State var selectedFolderViewModel: FolderViewModel?

	@AppStorage("timesOpened") var timesOpened = 0
	@AppStorage("homeViewSelected") var homeViewSelected = true

	// Query for searching
	@State var query: String = ""
	@Environment(\.isSearching) var isSearching
	@AppStorage("introSeen") var newUser = true
	@Environment(\.dismiss) var dismiss

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
				selectedFolderViewModel: $selectedFolderViewModel,
				query: $query
			)

			VStack {
				ProgressView()
				Text("If you are seeing this, something has probably gone wrong.\nTry quitting restarting Later")
			}
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
				             parentFolderViewModel: selectedFolderViewModel ?? folderListViewModel.folderViewModels[0],
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
			homeViewSelected = true
		}
		.searchable(text: $query, prompt: Text("Search..."))
	}

	private func toggleSidebar() {
		NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
	}
}
