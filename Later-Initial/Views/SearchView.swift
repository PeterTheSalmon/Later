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

	var body: some View {
		// FIXME: Logic for the SearchView
//		let filtered = listItems.ItemList.filter { toFilter in
//			toFilter.title.uppercased().contains(query.uppercased()) || toFilter.url.uppercased().contains(query.uppercased())
//		}
//		let faveFiltered = filtered.filter { toFilter in
//			toFilter.isFavourite
//		}

		VStack {
			HStack {
				Toggle("Show Favourites Only", isOn: $showFavouritesOnly)

				Spacer().frame(width: 40)

				SortStylePicker(linkViewModel: LinkListViewModel())
			}
			.padding(.top, 7)

			List {
//				ForEach(showFavouritesOnly ? faveFiltered : filtered) { item in
//					withAnimation(.linear) {
//						LinkDisplaySheet(item: item, listItems: listItems)
//					}
//				}
			}
		}
		.animation(.linear, value: showFavouritesOnly)
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
					Image(systemName: "plus.circle.fill")
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
