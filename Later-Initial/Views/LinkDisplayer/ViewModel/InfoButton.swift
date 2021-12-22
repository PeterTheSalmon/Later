//
//  LinkSheetIcons.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-08.
//

import SwiftUI

struct InfoButton: View {

	var hoveringReference: Bool
	var item: LinkItem
	@State private var isPresented = false

	var body: some View {
		Button {
			isPresented = true
		} label: {
			Image(systemName: "info.circle")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 20, height: 20)
		}
		.buttonStyle(DisplaySheetButtonStyle(hoveringReference: hoveringReference, item: item))
		.popover(isPresented: $isPresented, arrowEdge: .trailing) {
			VStack {
				Text("Info")
					.font(.title2)
				Divider()
				HStack(spacing: 3) {
					Text("Created on")
					Text(item.dateCreated, style: .date)
					Text("at")
					Text(item.dateCreated, style: .time)
				}
			}
			.padding()
			.frame(minWidth: 300)
		}
	}
}

struct InfoButton_Previews: PreviewProvider {
	static var previews: some View {
		DeleteButton(listItems: LinkItems(),
					 hoveringReference: true,
		             item: LinkItems.exampleItem)
	}
}
