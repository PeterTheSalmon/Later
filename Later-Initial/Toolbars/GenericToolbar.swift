//
//  GenericToolbar.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-30.
//

import Foundation
import SwiftUI

/// Toolbar for general use within Later
///
/// Contains two buttons:
///  - 􀏚 Toggle sidebar
///  - 􀅼 Bring up the new item sheet
struct GenericToolbar: ToolbarContent {
	@AppStorage("isShowingNewItemSheet") var isShowingNewItemSheet = false

	var body: some ToolbarContent {
		ToolbarItem(placement: .navigation) {
			Button {
				toggleSidebar()
			} label: {
				Image(systemName: "sidebar.left")
			}
		}
		ToolbarItem(placement: .navigation) {
			Button {
				isShowingNewItemSheet = true
			} label: {
				Image(systemName: Icons().newItem)
			}
			.help("New Item")
		}
	}

	private func toggleSidebar() {
		NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
	}
}
