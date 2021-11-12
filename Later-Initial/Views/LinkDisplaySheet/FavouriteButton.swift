//
//  LinkSheetIcons.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-08.
//

import SwiftUI

struct FavouriteButton: View {
	@ObservedObject var listItems: MockData

	var hoveringReference: Bool
	var item: LinkItem
	var itemIsFavourite: Bool

	var body: some View {
		HStack {
			Image(systemName: itemIsFavourite ? "star.fill" : "star")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 20, height: 20)
				.foregroundColor(itemIsFavourite ? .accentColor : .gray)
		}
		.opacity(item.isFavourite ? 100 : hoveringReference ? 100 : 0)
	}
}

struct LinkSheetIcons_Previews: PreviewProvider {
	static var previews: some View {
		FavouriteButton(listItems: MockData(),
		                hoveringReference: true,
		                item: MockData.exampleItem,
		                itemIsFavourite: true)
	}
}
