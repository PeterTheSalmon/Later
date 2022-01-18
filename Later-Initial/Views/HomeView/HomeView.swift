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

	func updateProgressValue() {
		Task {
			while true {
				try await Task.sleep(nanoseconds: 550_000_000) // 0.15 seconds

				opacity -= 0.02
				if opacity <= 0.0 {
					opacity = 1.0
					let previousInt = randomInt
					repeat {
						randomInt = Int.random(in: 0 ..< AppInfo.tips.count)
					} while previousInt == randomInt
				}
			}
		}
	}

	var body: some View {
		if isSearching && !query.isEmpty {
			Text("Ah yes, searching a static view.\nMay I recommend selecting a folder?")
				.multilineTextAlignment(.center)
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
					updateProgressValue()
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

		} else {
			VStack {
				Spacer()

				Text("Welcome Back!")
					.font(.largeTitle)
					.fontWeight(.bold)
					.padding()

				Text("Select a folder, or presss ⌘ ⇧ n create a new one")

				Spacer()

				if AppInfo.latestVersion != nil && AppInfo.version != AppInfo.latestVersion {
					UpdatePrompt()
				} else {
					ZStack {
						RoundedRectangle(cornerRadius: 5)
							.foregroundColor(Color("Tip Rectangle"))
							.frame(width: 300, height: 100)
						Text(AppInfo.tips[randomInt])
							.frame(width: 280, height: 80)
						VStack {
							HStack {
								Spacer()
								VStack {
									Spacer()
									Image(systemName: Icons().arrow)
										.resizable()
										.aspectRatio(contentMode: .fit)
										.frame(width: 20, height: 20)
										.opacity(opacity)
										.animation(.linear(duration: Constants().animationDuration), value: opacity)
										.padding(3)
								}
							}
						}
					}
					.frame(width: 300, height: 100)
					.animation(.easeInOut, value: randomInt)
					.onTapGesture {
						opacity = 1.0
						let previousInt = randomInt
						repeat {
							randomInt = Int.random(in: 0 ..< AppInfo.tips.count)
						} while previousInt == randomInt
					}
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
				updateProgressValue()
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
