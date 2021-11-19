//
//  CopyButton.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-14.
//

import SwiftUI

struct CopyButton: View {
	var hoveringReference: Bool
	var item: LinkItem
	@State private var isTapped = false
	@Binding var justCopied: Bool

	func copyToClipboard() {
		let pasteboard = NSPasteboard.general
		pasteboard.declareTypes([.string], owner: nil)
		pasteboard.setString(item.url, forType: .string)
	}
	
	func noLongerCopied() {
		Task {
			await Task.sleep(1 * 1_000_000_000) // two seconds
			justCopied = false
		}
	}

	var body: some View {
		Button {
			copyToClipboard()
			justCopied = true
			noLongerCopied()
		} label: {
			Image(systemName: "doc.on.clipboard")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 20, height: 20)
		}
		.buttonStyle(DisplaySheetButtonStyle(hoveringReference: hoveringReference, item: item))
	}
}



struct CopyButton_Previews: PreviewProvider {
	static var previews: some View {
		CopyButton(hoveringReference: true,
				   item: MockData.exampleItem, justCopied: .constant(false))
	}
}
