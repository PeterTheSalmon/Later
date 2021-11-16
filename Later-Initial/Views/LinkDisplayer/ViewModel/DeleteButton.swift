//
//  LinkSheetIcons.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-08.
//

import SwiftUI

struct DeleteButton: View {
	@ObservedObject var listItems: MockData

	var hoveringReference: Bool
	var item: LinkItem
	var itemIndex: Int?
	
	func deleteItem() {
		if itemIndex != nil {
			listItems.ItemList.remove(at: itemIndex!)
		}
	}

	var body: some View {
		Button {
			deleteItem()
		} label: {
			Image(systemName: "trash")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 18, height: 18)
		}
		.buttonStyle(DisplaySheetButtonStyle(hoveringReference: hoveringReference, item: item))
	}
}

struct DeleteButton_Previews: PreviewProvider {
	static var previews: some View {
		DeleteButton(listItems: MockData(),
					 hoveringReference: true,
		             item: MockData.exampleItem)
	}
}
