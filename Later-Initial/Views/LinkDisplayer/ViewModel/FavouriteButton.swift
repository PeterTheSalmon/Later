//
//  LinkSheetIcons.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-08.
//

// MARK: STATUS: Works

import SwiftUI

struct FavouriteButton: View {

	var hoveringReference: Bool
	var linkViewModel: LinkViewModel
	var itemIndex: Int?

	private func toggleFavourite() {
		var updatedLink = linkViewModel.link
		updatedLink.isFavourite.toggle()
		update(item: updatedLink)
	}
	
	private func update(item: LinkItem) {
		linkViewModel.update(item: item)
	}
	
	var body: some View {
		HStack {
			Image(systemName: linkViewModel.link.isFavourite ? "star.fill" : "star")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 20, height: 20)
				.foregroundColor(linkViewModel.link.isFavourite ? .accentColor : hoveringReference ? .gray : Color("Icon"))
		}
		.animation(.linear(duration: 0.1), value: hoveringReference)
		.onTapGesture {
			toggleFavourite()
		}
	}
}

struct LinkSheetIcons_Previews: PreviewProvider {
	static var previews: some View {
		Text("fix")
	}
}
