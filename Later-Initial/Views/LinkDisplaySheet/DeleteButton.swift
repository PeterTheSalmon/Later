//
//  LinkSheetIcons.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-08.
//

import SwiftUI

struct DeleteButton: View {
	@ObservedObject var listItems: MockData

	var hoveringReference: Bool
	var item: LinkItem

	var body: some View {
		HStack {
			Image(systemName: "trash")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 18, height: 18)
				.foregroundColor(.gray)
		}
		.opacity(hoveringReference ? 100 : 0)
	}
}

struct DeleteButton_Previews: PreviewProvider {
	static var previews: some View {
		DeleteButton(listItems: MockData(),
		             hoveringReference: true,
		             item: MockData.exampleItem)
	}
}
