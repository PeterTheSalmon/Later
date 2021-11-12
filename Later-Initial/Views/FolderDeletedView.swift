//
//  FolderDeletedView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-11.
//

import SwiftUI

struct FolderDeletedView: View {
	var body: some View {
		HStack {
			Image(systemName: "questionmark.folder")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 70, height: 70)

			VStack(alignment: .leading) {
				Text("You just deleted this folder!")
					.font(.title)
				Text("Make a new one, or select a different folder to view your items.")
					.frame(maxWidth: 250, alignment: .leading)
			}
			.padding()
		}
	}
}

struct FolderDeletedView_Previews: PreviewProvider {
	static var previews: some View {
		FolderDeletedView()
	}
}
