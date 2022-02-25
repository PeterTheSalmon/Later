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
	@ObservedObject var linkListViewModel: LinkListViewModel
	@ObservedObject var folderListViewModel: FolderListViewModel

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
	@AppStorage("introSeen") var newUser = true
	@Environment(\.dismiss) var dismiss

	@EnvironmentObject var authViewModel: AuthViewModel

	@AppStorage("logInPageActive") var logInPageActive = true

	var body: some View {
		NavigationView {
			if authViewModel.signedIn {
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
				.environmentObject(linkListViewModel)
				.environmentObject(folderListViewModel)

				VStack {
					ProgressView()
					Text("If you are seeing this, something has probably gone wrong. Select another item in the sidebar")
						.padding()
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
							Image(systemName: Icons().newItem)
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
			} else {
				LoggedOutView()
					.onAppear {
						logInPageActive = true
						folderListIsEmpty = false
					}

				ProgressView()
			}
		}

		.sheet(isPresented: $newUser) {
			WelcomeScreen(newUserValue: $newUser)
		}
		.sheet(isPresented: $folderListIsEmpty) {
			NewFolderSheet(folderViewModel: folderListViewModel, allowExitCommand: false)
		}

		.onAppear {
			// Check if the user is signed in, and update the signedIn state based on what is returned
			authViewModel.signedIn = authViewModel.isSignedIn
			timesOpened += 1
			Task {
				try await Task.sleep(nanoseconds: 100_000_000)
				DispatchQueue.main.async {
					homeViewSelected = true
				}
			}
		}
	}

	private func toggleSidebar() {
		NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
	}
}
