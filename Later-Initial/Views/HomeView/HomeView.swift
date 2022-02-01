//
//  NoFolderSelectedView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

import SwiftUI

struct HomeView: View {
	@ObservedObject var folderListViewModel: FolderListViewModel
	@ObservedObject var linkListViewModel: LinkListViewModel

	@Binding var selectedFolder: FolderItem?

	@Environment(\.isSearching) var isSearching
	@Binding var query: String
	@Binding var isShowingSheet: Bool
	@Binding var isShowingNewFolderSheet: Bool
	@State private var randomInt = Int.random(in: 0 ..< AppInfo.tips.count)
	@State private var opacity = 1.0

	@State private var updatePromptShown = false

	@ObservedObject var versionViewModel = VersionViewModel()

	var body: some View {
		VStack {
			Spacer()

			Text("Welcome Back!")
				.font(.largeTitle)
				.fontWeight(.bold)
				.padding()

			Text("Select a folder, or press ⌘ ⇧ n create a new one")

			Spacer()

			if updatePromptShown {
				UpdatePrompt()
			} else {
				TipRectangle()
			}

			Spacer()
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
					isShowingSheet = true
				} label: {
					Image(systemName: Icons().newItem)
				}
				.help("New Item")
			}
		}
		.onAppear {
			versionViewModel.getVersion()
			Task {
				try await Task.sleep(nanoseconds: 1_000_000_000)
				if versionViewModel.latestVersion != nil {
					if AppInfo.version != versionViewModel.latestVersion {
						AppInfo.latestVersion = versionViewModel.latestVersion
						withAnimation(.linear(duration: Constants().animationTime)) { updatePromptShown = true }
					}
				}
			}
		}

		.sheet(isPresented: $isShowingSheet) {
			NewItemSheet(folderListViewModel: folderListViewModel,
			             parentFolderViewModel: folderListViewModel.folderViewModels[0],
			             linkListViewModel: linkListViewModel)
		}
		.sheet(isPresented: $isShowingNewFolderSheet) {
			NewFolderSheet(folderViewModel: FolderListViewModel(), allowExitCommand: true)
		}
		.padding()
	}

	private func toggleSidebar() {
		NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
	}
}

struct NoFolderSelectedView_Previews: PreviewProvider {
	static var previews: some View {
		// FIXME: Add preview
		Text("Fix")
	}
}
