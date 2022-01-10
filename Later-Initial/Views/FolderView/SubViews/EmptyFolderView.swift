//
//  EmptyListView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

import SwiftUI

struct EmptyFolderView: View {
	
	var folder: FolderItem?
	var fallbackFolder = FolderItem(name: "this folder")
	
	var body: some View {
		VStack {
			Text("You don't have any saved links in \"\(folder?.name ?? fallbackFolder.name)\"")
				.font(.title)
				.padding()

			Text("Click the \(Image(systemName: Icons().newItem)) to add one!")

			.font(.headline)
		}
	}
}

struct EmptyListView_Previews: PreviewProvider {
	static var previews: some View {
		EmptyFolderView(folder: FolderItem(name: "Test"))
	}
}
