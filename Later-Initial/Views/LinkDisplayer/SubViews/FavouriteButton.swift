//
//  LinkSheetIcons.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-08.
//

// MARK: STATUS: Works mostly

import SwiftUI

struct FavouriteButton: View {
	var hoveringReference: Bool
	var linkViewModel: LinkViewModel
	var itemIndex: Int?
	@ObservedObject var linkListViewModel: LinkListViewModel
	@State private var needToChangeFaveStatusOnDisappear = false
	@AppStorage("updateFavicon") var updateFavicon = false

	@Binding var needToToggleFavouriteOnDisappear: Bool


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
			if linkViewModel.isFakeFavourite {
				/// This code is basically an inversion of the below
				Image(systemName: linkViewModel.link.isFavourite ? Icons().emptyStar : Icons().filledStar)
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 20, height: 20)
					.foregroundColor(linkViewModel.link.isFavourite ? hoveringReference ? .gray : Color("Icon") : .accentColor)

			} else {
				Image(systemName: linkViewModel.link.isFavourite ? Icons().filledStar : Icons().emptyStar)
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 20, height: 20)
					.foregroundColor(linkViewModel.link.isFavourite ? .accentColor : hoveringReference ? .gray : Color("Icon"))
			}
		}

		.animation(.linear(duration: Constants().animationDuration), value: hoveringReference)
		.onTapGesture {
			
			linkViewModel.isFakeFavourite.toggle()

			/// This line tells the parent view to update the ACTUAL link state when this view disappears
			needToToggleFavouriteOnDisappear.toggle()
		}
	}
}

struct LinkSheetIcons_Previews: PreviewProvider {
	static var previews: some View {
		Text("fix")
	}
}
