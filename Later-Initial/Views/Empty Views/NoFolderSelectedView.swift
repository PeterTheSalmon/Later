//
//  NoFolderSelectedView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

import SwiftUI

struct NoFolderSelectedView: View {
	
	@Environment(\.isSearching) var isSearching
	@Binding var query: String
	@ObservedObject var listItems: MockData
	@Binding var isShowingSheet: Bool
	@ObservedObject var activeFolderList: FolderClass
	@Binding var isShowingNewFolderSheet: Bool
	
	var body: some View {
		VStack {
			if isSearching && !query.isEmpty {
				SearchView(query: $query,
				           listItems: listItems,
				           isShowingNewItemSheet: $isShowingSheet,
				           activeFolderList: activeFolderList,
				           isShowingNewFolderSheet: $isShowingNewFolderSheet)
			} else {
				Text("Select a folder to view saved links")
					.font(.title)
					.padding()
				Image(systemName: "folder")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 100)
			}
		}
	}
}

//struct NoFolderSelectedView_Previews: PreviewProvider {
//	static var previews: some View {
//		NoFolderSelectedView()
//	}
//}
