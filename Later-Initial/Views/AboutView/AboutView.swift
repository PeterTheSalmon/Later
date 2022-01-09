//
//  AboutView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-10.
//

/// this is just here for info and advertising, basically :)

import SwiftUI

struct AboutView: View {
	
	@ObservedObject var folderListViewModel: FolderListViewModel
	@ObservedObject var linkListViewModel: LinkListViewModel
	@Binding var selectedFolder: FolderItem?
	
	@Binding var timesOpened: Int
	@Binding var isShowingNewFolderSheet: Bool
	@Binding var isShowingSheet: Bool
	@Environment(\.isSearching) var isSearching
	@State var query: String = ""
	@Binding var justDeletedFolder: Bool
	@AppStorage("homeViewSelected") var homeViewSelected = true


	var body: some View {
		if isSearching && !query.isEmpty {
			
			Text("What were you searching for?")
				.onDisappear {
					justDeletedFolder = false
				}
				.sheet(isPresented: $isShowingSheet) {
					NewItemSheet(folderListViewModel: folderListViewModel,
											 parentFolderViewModel: folderListViewModel.folderViewModels[0],
											 linkListViewModel: linkListViewModel)
				}
				.sheet(isPresented: $isShowingNewFolderSheet) {
					NewFolderSheet(folderViewModel: FolderListViewModel(), allowExitCommand: true)
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
				.navigationTitle("About")
			
		} else {
			VStack(alignment: .leading) {
				AboutTitle()

				CreatorVersion()

				AppDescription()

				SocialButtons()

				StatisticsMessage(timesOpened: timesOpened)

				LicensesButton()
			}
			.onDisappear {
				justDeletedFolder = false
			}
			.sheet(isPresented: $isShowingSheet) {
				NewItemSheet(folderListViewModel: folderListViewModel,
										 parentFolderViewModel: folderListViewModel.folderViewModels[0],
										 linkListViewModel: linkListViewModel)
			}
			.sheet(isPresented: $isShowingNewFolderSheet) {
				NewFolderSheet(folderViewModel: FolderListViewModel(), allowExitCommand: true)
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
			.navigationTitle("About")
		}
	}

	private func toggleSidebar() {
		NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
	}
}

struct AboutView_Previews: PreviewProvider {
	static var previews: some View {
		Text("fix")
	}
}
