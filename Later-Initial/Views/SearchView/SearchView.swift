//
//  SearchView.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-20.
//

import SwiftUI

struct SearchView: View {
	@Binding var query: String
	@Environment(\.openURL) var openURL
	@State var isHoveringRectangle = false
	@Binding var isShowingNewItemSheet: Bool
	@Binding var isShowingNewFolderSheet: Bool
	@State var showFavouritesOnly = false
	@ObservedObject var linkListViewModel: LinkListViewModel

	var body: some View {
		/// Filtered is all items in which the title or url contain the search term
		let filtered = linkListViewModel.linkViewModels.filter { linkViewModel in
			linkViewModel.link.title.uppercased().contains(query.uppercased()) || linkViewModel.link.url.uppercased().contains(query.uppercased())
		}

		/// FaveFiltered is only favourite items
		let faveFiltered = filtered.filter { linkViewModel in
			linkViewModel.link.isFavourite || linkViewModel.isFakeFavourite
		}

		VStack {
			HStack {
				Toggle("Show Favourites Only", isOn: $showFavouritesOnly)

				Spacer().frame(width: 40)

				SortStylePicker(linkListViewModel: linkListViewModel)
			}
			.padding(.top, 7)
			List {
				ForEach(showFavouritesOnly ? faveFiltered : filtered) { linkViewModel in
					withAnimation(.linear) {
						LinkDisplaySheet(linkViewModel: linkViewModel, linkListViewModel: linkListViewModel)
					}
				}
			}
		}
		.navigationTitle("Searching...")
		.animation(.linear(duration: Constants().animationDuration), value: showFavouritesOnly)
		.sheet(isPresented: $isShowingNewItemSheet) {
			// FIXME: New Item Sheet goes here
		}
		.sheet(isPresented: $isShowingNewFolderSheet) {
			// FIXME: New Folder Sheet goes here
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
					isShowingNewItemSheet = true
				} label: {
					Image(systemName: Icons().newItem)
				}
				.help("New Item")
			}
		}
	}

	private func toggleSidebar() {
		NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
	}
}

struct SearchView_Previews: PreviewProvider {
	static var previews: some View {
		Text("Fix")
		// FIXME: Add previews
	}
}
