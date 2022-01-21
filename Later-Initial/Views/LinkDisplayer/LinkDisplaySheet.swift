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
	@ObservedObject var linkListViewModel: LinkListViewModel
	@AppStorage("showFavicon") var showFavicon = true

	/// Variable to see if we need to toggle the favourite
	@State var needToToggleFavouriteOnDisappear: Bool = false

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

					EditLinkButton(hoveringReference: isHoveringRectangle, linkViewModel: linkViewModel, itemIndex: 0, linkListViewModel: linkListViewModel)
						.help("Edit")

					CopyButton(hoveringReference: isHoveringRectangle,
					           item: linkViewModel.link, justCopied: $justCopied)
						.help("Copy")

					DeleteButton(hoveringReference: isHoveringRectangle,
					             linkViewModel: linkViewModel)
						.help("Delete")

					FavouriteButton(hoveringReference: isHoveringRectangle, linkViewModel: linkViewModel, linkListViewModel: linkListViewModel, needToToggleFavouriteOnDisappear: $needToToggleFavouriteOnDisappear)
						.help("Add to Favourites")
						.padding(.trailing, showFavicon ? 0 : nil)
				}

				if showFavicon {
					Divider().frame(height: 40)
					FaviconDisplay(linkViewModel: linkViewModel)
				}
			}
		}

		.onDisappear {
			if needToToggleFavouriteOnDisappear {
				toggleFavourite()
				linkViewModel.isFakeFavourite = false
			}
		}

		.frame(height: 50)
		.padding(.horizontal, 1.5)
		.onHover { hoveringRectangle in
			isHoveringRectangle = hoveringRectangle
		}
	}
	
	/// Two functions to toggle favourites
	private func toggleFavourite() {
		var updatedLink = linkViewModel.link
		updatedLink.isFavourite.toggle()
		update(item: updatedLink)
	}
	
	private func update(item: LinkItem) {
		linkViewModel.update(item: item)
	}
}

struct LinkDisplaySheet_Previews: PreviewProvider {
	static var previews: some View {
		Text("fix")
	}
}
