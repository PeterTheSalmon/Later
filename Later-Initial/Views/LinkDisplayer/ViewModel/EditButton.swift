//
//  CopyButton.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-14.
//

import SwiftUI

struct EditButton: View {
	var hoveringReference: Bool
	var item: LinkItem
	@State var isPresented = false
	@State var newTitle = ""
	@State var newLink = ""
	@ObservedObject var listItems: LinkItems
	@Environment(\.dismiss) var dismiss
	var itemIndex: Int

	func editItem() {
		isPresented = false
		let currentIndex = itemIndex
		let newItem = LinkItem(title: newTitle,
		                       url: checkURLconventions(urlString: newLink),
		                       isFavourite: item.isFavourite,
		                       parentFolder: item.parentFolder)
		listItems.ItemList.remove(at: itemIndex)
		listItems.ItemList.insert(newItem, at: currentIndex)
	}

	var body: some View {
		Button {
			isPresented = true
		} label: {
			Image(systemName: "pencil.circle")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 20, height: 20)
		}
		.buttonStyle(DisplaySheetButtonStyle(hoveringReference: hoveringReference, item: item))
		.popover(isPresented: $isPresented, arrowEdge: .trailing) {
			VStack {
				Form {
					TextField("Title", text: $newTitle)
					TextField("URL", text: $newLink)
				}
				.textFieldStyle(.roundedBorder)
				.onSubmit { editItem() }
				
				Button {
					editItem()
				} label: {
					Label("Save", systemImage: "tray.and.arrow.down")
				}
				.buttonStyle(SaveButton(colour: Color.accentColor))
				.keyboardShortcut(.defaultAction)
			}
			.frame(minWidth: 300, maxWidth: 500, maxHeight: 80)
			.padding()
		}
		.onAppear {
			newTitle = item.title
			newLink = item.url
		}
	}
}
