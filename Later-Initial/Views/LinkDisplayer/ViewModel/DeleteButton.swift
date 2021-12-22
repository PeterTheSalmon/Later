//
//  LinkSheetIcons.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-08.
//

import SwiftUI

struct DeleteButton: View {
	@ObservedObject var listItems: LinkItems

	var hoveringReference: Bool
	var item: LinkItem
	var itemIndex: Int?
	@State var alertPresented = false

	// If true, link items are deleted in one click
	@AppStorage("instantDeleteLink") var instantDeleteLink = false
	
	func deleteItem() {
		if itemIndex != nil {
			listItems.ItemList.remove(at: itemIndex!)
		}
	}

	var body: some View {
		Button {
			if instantDeleteLink { deleteItem() } else { alertPresented = true }
		} label: {
			Image(systemName: "trash")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 18, height: 18)
		}
		.buttonStyle(DisplaySheetButtonStyle(hoveringReference: hoveringReference, item: item))
		.alert("Delete Item?", isPresented: $alertPresented) {
			Button("Delete", role: .destructive) { deleteItem() }
		}
	}
}

struct DeleteButton_Previews: PreviewProvider {
	static var previews: some View {
		DeleteButton(listItems: LinkItems(),
					 hoveringReference: true,
		             item: LinkItems.exampleItem)
	}
}
