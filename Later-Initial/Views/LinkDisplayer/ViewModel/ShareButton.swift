//
//  ShareButton.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-02.
//

import AppKit
import SwiftUI

struct ShareButton: View {
	var item: LinkItem
	var hoveringReference: Bool
	@State var sharePresented = false

	var body: some View {
		Button {
			sharePresented = true

		} label: {
			Image(systemName: "square.and.arrow.up")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 20, height: 20)
		}
		.buttonStyle(DisplaySheetButtonStyle(hoveringReference: hoveringReference, item: item))
		.foregroundColor(hoveringReference ? .gray : Color("Icon"))
		.animation(.linear(duration: 0.1), value: hoveringReference)

		.popover(isPresented: $sharePresented) {
			VStack(alignment: .leading, spacing: 2) {				
				ForEach(NSSharingService.sharingServices(forItems: [item.title, item.url]), id: \.title) { service in
					HStack {
						Image(nsImage: service.image)
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width: 20, height: 20)
						Text(service.title)
					}
					.onTapGesture { service.perform(withItems: [item.title, item.url]) }
				}
			}
			.font(.title3)

			.frame(width: 120, alignment: .leading)
			.padding(4)
		}
	}
}

struct SimpleMenuStyle: MenuStyle {
	func makeBody(configuration: Configuration) -> some View {
		Menu(configuration)
			.menuStyle(.borderlessButton)
			.frame(width: 40, height: 20)
	}
}

struct ShareButton_Previews: PreviewProvider {
	static var previews: some View {
		ShareButton(item: LinkItems.exampleItem, hoveringReference: true)
	}
}
