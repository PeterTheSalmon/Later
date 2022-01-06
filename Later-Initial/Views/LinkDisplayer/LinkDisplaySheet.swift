//
//  LinkDisplaySheet.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-10-30.
//

import AppKit
import SwiftUI

struct LinkDisplaySheet: View {
	var linkViewModel: LinkViewModel
	@Environment(\.openURL) var openURL
	@State var isHoveringRectangle: Bool = false
	@State var isHoveringText: Bool = false
	@State var justCopied: Bool = false
	@State private var showShareSheet = false

//	var itemIndex: Int? {
//		listItems.ItemList.firstIndex(where: { $0.id == item.id }) ?? nil
//	}

	var body: some View {
		ZStack {
			BackgroundRectangle(hoverStatus: isHoveringRectangle)

			HStack {
				TitleLink(subItem: linkViewModel.link, justCopied: $justCopied)

				Spacer()

				Group { // Buttons
					ShareButton(linkViewModel: linkViewModel, hoveringReference: isHoveringRectangle)
						.help("Share to other apps")

					InfoButton(hoveringReference: isHoveringRectangle, item: linkViewModel.link)
						.help("Info")

					EditButton(hoveringReference: isHoveringRectangle, item: linkViewModel.link, itemIndex: 0)
						.help("Edit")

					CopyButton(hoveringReference: isHoveringRectangle,
					           item: linkViewModel.link, justCopied: $justCopied)
						.help("Copy")

					DeleteButton(hoveringReference: isHoveringRectangle,
					             item: linkViewModel.link)
						.help("Delete")

					FavouriteButton(hoveringReference: isHoveringRectangle, linkViewModel: linkViewModel)
						.help("Add to Favourites")

					Divider().frame(height: 40)

					
				}
				FaviconDisplay(linkViewModel: linkViewModel)
			}
		}

		.frame(height: 50)
		// .padding(.vertical, 1)
		.padding(.horizontal, 1.5)
		.onHover { hoveringRectangle in
			isHoveringRectangle = hoveringRectangle
		}
	}
}

struct LinkDisplaySheet_Previews: PreviewProvider {
	static var previews: some View {
		Text("fix")
	}
}
