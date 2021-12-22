//
//  LinkSheetIcons.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-08.
//

import SwiftUI

struct FavouriteButton: View {
	@ObservedObject var listItems: LinkItems

	var hoveringReference: Bool
	var item: LinkItem
	var itemIsFavourite: Bool
	var itemIndex: Int?

	var body: some View {
		HStack {
			Image(systemName: itemIsFavourite ? "star.fill" : "star")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 20, height: 20)
				.foregroundColor(itemIsFavourite ? .accentColor : hoveringReference ? .gray : Color("Icon"))
		}
		.animation(.linear(duration: 0.1), value: hoveringReference)
		.onTapGesture {
			if itemIndex != nil {
				listItems.ItemList[itemIndex!].isFavourite.toggle()
			}
		}
	}
}

struct LinkSheetIcons_Previews: PreviewProvider {
	static var previews: some View {
		FavouriteButton(listItems: LinkItems(),
		                hoveringReference: true,
		                item: LinkItems.exampleItem,
		                itemIsFavourite: true)
	}
}
