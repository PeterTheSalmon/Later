//
//  CopyButton.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-14.
//

// MARK: STATUS: Works

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

	
	/// Wait a few seconds and then hide the copy message
	func noLongerCopied() {
		Task {
			do {
				try await Task.sleep(nanoseconds: 1000000000)
			} catch {
				print("well shit")
			}
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
							 item: LinkItem(title: "Test", url: "google.ca", parentFolderId: "blahblahblah"), justCopied: .constant(false))
	}
}
