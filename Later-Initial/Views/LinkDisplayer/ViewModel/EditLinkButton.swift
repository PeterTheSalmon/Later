//
//  CopyButton.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-14.
//

import SwiftUI

struct EditLinkButton: View {
	var hoveringReference: Bool
	var linkViewModel: LinkViewModel
	@State var isPresented = false
	@State var newTitle = ""
	@State var newLink = ""
	@Environment(\.dismiss) var dismiss
	var itemIndex: Int
	@AppStorage("selectedSortStyle") var selectedStyle = 0

	
	private func editLink() {
		isPresented = false
		var updatedLink = linkViewModel.link
		updatedLink.title = newTitle
		updatedLink.url = newLink
		update(item: updatedLink)
		// TODO: Add sorting
	}
	
	private func update(item: LinkItem) {
		linkViewModel.update(item: item)
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
		.buttonStyle(DisplaySheetButtonStyle(hoveringReference: hoveringReference, item: linkViewModel.link))
		.popover(isPresented: $isPresented, arrowEdge: .trailing) {
			VStack {
				Form {
					TextField("Title", text: $newTitle)
					TextField("URL", text: $newLink)
				}
				.textFieldStyle(.roundedBorder)
				.onSubmit { editLink() }
				
				Button {
					editLink()
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
			newTitle = linkViewModel.link.title
			newLink = linkViewModel.link.url
		}
	}
}
