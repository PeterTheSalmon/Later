//
//  EmptyListView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

import SwiftUI

struct EmptyListView: View {
	var body: some View {
		VStack {
			Text("You don't have any saved links in this Folder")
				.font(.title)
			HStack {
				Text("Click the")
				Image(systemName: "plus.circle.fill")
				Text("to add one!")
			}
			.font(.headline)
			.padding()
		}
	}
}

struct EmptyListView_Previews: PreviewProvider {
	static var previews: some View {
		EmptyListView()
	}
}
