//
//  Extensions.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation
import SwiftUI

extension View {
	@discardableResult
	func openInWindow(title: String, sender: Any?) -> NSWindow {
		let controller = NSHostingController(rootView: self)
		let win = NSWindow(contentViewController: controller)
		win.contentViewController = controller
		win.title = title
		win.makeKeyAndOrderFront(sender)
		return win
	}
}
