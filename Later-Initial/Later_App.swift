//
//  Later_InitialApp.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-10-30.
//

import SwiftUI
import AppKit

// main program
@main
struct Later: App {
	// these states are declared here as they are used in keyboard shortcuts
	@State var isShowingNewFolderSheet = false
	@State var isShowingNewItemSheet = false
	@Environment(\.isSearching) var isSearching

	var body: some Scene {
		WindowGroup {
			PrimaryView(isShowingNewItemSheet: $isShowingNewItemSheet, isShowingNewFolderSheet: $isShowingNewFolderSheet)
				// this onReceive disables full screen mode, disabling out the green button
				.onReceive(NotificationCenter.default.publisher(for: NSApplication.willUpdateNotification), perform: { _ in
					for window in NSApplication.shared.windows {
						window.standardWindowButton(.zoomButton)?.isEnabled = false
					}
				})
				.frame(minWidth: 400, idealWidth: 600, maxWidth: 900, minHeight: 300, idealHeight: 300, maxHeight: 500)
		}
		.commands {
			SidebarCommands()
			CommandGroup(replacing: CommandGroupPlacement.newItem) {
				Button("New Item") {
					isShowingNewItemSheet = true
				}.keyboardShortcut("n")

				Button("New Folder") {
					isShowingNewFolderSheet = true
				}.keyboardShortcut("n", modifiers: [.command, .shift])
			}
		}
		Settings {
			SettingsView()
		}
	}
}
