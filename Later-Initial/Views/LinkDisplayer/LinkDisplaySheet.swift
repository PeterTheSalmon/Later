//
//  LinkDisplaySheet.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-10-30.
//

import SwiftUI

struct LinkDisplaySheet: View {
	var item: LinkItem
	@Environment(\.openURL) var openURL
	@ObservedObject var listItems: LinkItems
	@State var isHoveringRectangle: Bool = false
	@State var isHoveringText: Bool = false
	@State var justCopied: Bool = false

	var itemIndex: Int? {
		listItems.ItemList.firstIndex(where: { $0.id == item.id }) ?? nil
	}

	var body: some View {
		ZStack {
			BackgroundRectangle(hoverStatus: isHoveringRectangle)

			HStack {
				TitleLink(subItem: item, justCopied: $justCopied)
				
				Spacer()
				
				InfoButton(hoveringReference: isHoveringRectangle, item: item)
					.help("Link Info")
				
				EditButton(hoveringReference: isHoveringRectangle, item: item, listItems: listItems, itemIndex: itemIndex ?? 0)
					.help("edit Link")
				
				CopyButton(hoveringReference: isHoveringRectangle,
						   item: item, justCopied: $justCopied)
					.help("Copy Link")


				DeleteButton(listItems: listItems,
							 hoveringReference: isHoveringRectangle,
				             item: item,
				             itemIndex: itemIndex)
					.help("Delete Link")

				FavouriteButton(listItems: listItems,
				                hoveringReference: isHoveringRectangle,
				                item: item,
				                itemIsFavourite: item.isFavourite,
				                itemIndex: itemIndex)
					.help("Add to Favourites")

				Divider().frame(height: 40)

				FaviconDisplay(item: item)
			}
		}
		.frame(height: 50)
		.padding(.vertical, 1)
		.padding(.horizontal, 1.5)
		.onHover { hoveringRectangle in
			isHoveringRectangle = hoveringRectangle
		}
	}
}

struct LinkDisplaySheet_Previews: PreviewProvider {
	static var previews: some View {
		LinkDisplaySheet(item: LinkItems.exampleItem, listItems: LinkItems())
	}
}
