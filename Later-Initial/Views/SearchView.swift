//
//  SearchView.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-20.
//

import SwiftUI

struct SearchView: View {
	@Binding var query: String
	@ObservedObject var listItems: MockData
	@Environment(\.openURL) var openURL
	@State var isHoveringRectangle = false
	@Binding var isShowingNewItemSheet: Bool
	@ObservedObject var activeFolderList: FolderClass
	@Binding var isShowingNewFolderSheet: Bool

	var body: some View {
		let filtered = listItems.ItemList.filter { toFilter in
			toFilter.title.contains(query) || toFilter.url.contains(query)
		}

		List {
			ForEach(filtered) { item in
				withAnimation(.linear) {
					LinkDisplaySheet(item: item, listItems: listItems)
				}
			}
		}
		.sheet(isPresented: $isShowingNewItemSheet) {
			NewItemSheet(listItems: listItems, activeFolderList: activeFolderList, parentFolder: activeFolderList.folderList[0])
		}
		.sheet(isPresented: $isShowingNewFolderSheet) {
			NewFolderSheet(activeFolderList: activeFolderList)
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
		SearchView(query: .constant("reddit"), listItems: MockData(), isShowingNewItemSheet: .constant(false), activeFolderList: FolderClass(), isShowingNewFolderSheet: .constant(false))
	}
}
