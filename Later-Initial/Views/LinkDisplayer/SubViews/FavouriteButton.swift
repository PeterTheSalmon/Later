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
	@ObservedObject var linkListViewModel: LinkListViewModel
	@State private var needToChangeFaveStatusOnDisappear = false
	@AppStorage("updateFavicon") var updateFavicon = false

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
			Image(systemName: linkViewModel.link.isFavourite ? Icons().filledStar : Icons().emptyStar)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 20, height: 20)
				.foregroundColor(linkViewModel.link.isFavourite ? .accentColor : hoveringReference ? .gray : Color("Icon"))
		}
		.animation(.linear(duration: Constants().animationDuration), value: hoveringReference)
		.onTapGesture {
			withAnimation(.linear) {
				toggleFavourite()
				Task {
					try await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds
					withAnimation(.linear) {
						SortList(linkListViewModel: linkListViewModel)
					}
					updateFavicon.toggle()
				}
			}
		}
	}
}

struct LinkSheetIcons_Previews: PreviewProvider {
	static var previews: some View {
		Text("fix")
	}
}
