//
//  Later_InitialApp.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-10-30.
//

import Firebase
import SwiftUI

@main
struct Later: App {
	/// These states are declared here as they are used in keyboard shortcuts
	@State var isShowingNewFolderSheet = false
	@State var isShowingNewItemSheet = false

	init() {
		/// Prepare Firestore when app launches
		FirebaseApp.configure()
	}

	var body: some Scene {
		WindowGroup {
			/// NavigationView
			PrimaryView(isShowingNewItemSheet: $isShowingNewItemSheet,
			            isShowingNewFolderSheet: $isShowingNewFolderSheet)

				/// This onReceive disables full screen mode, greying out the green button
				.onReceive(NotificationCenter.default.publisher(for: NSApplication.willUpdateNotification), perform: { _ in
					for window in NSApplication.shared.windows {
						window.standardWindowButton(.zoomButton)?.isEnabled = false
					}
				})

				/// Framing for the app as a whole.
				/// Limits it pretty strongly as the app looks terrible when big
				.frame(minWidth: 400, idealWidth: 600, maxWidth: 900, minHeight: 300, idealHeight: 300, maxHeight: 500)
		}
		.commands {
			SidebarCommands() /// toggle sidebar button
			CommandGroup(replacing: CommandGroupPlacement.newItem) {
				Button("New Item") {
					isShowingNewItemSheet = true
				}.keyboardShortcut("n")

				Button("New Folder") {
					isShowingNewFolderSheet = true
				}.keyboardShortcut("n", modifiers: [.command, .shift])
			}
		}

		// Putting settings here allows for better-looking tabs and ⌘, by default
		Settings {
			SettingsView()
		}
	}
}
