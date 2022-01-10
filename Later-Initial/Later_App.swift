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

	@AppStorage("folderManagerActive") var folderManagerActive = false
	@AppStorage("homeViewSelected") var homeViewSelected = true
	@AppStorage("folderSheetPresented") var folderSheetPresented = false

	init() {
		folderManagerActive = false
		homeViewSelected = true
		FirebaseApp.configure()
		/// If not signed in, sign in anonymously
		AuthenticationService.signIn()
	}

	var body: some Scene {
		WindowGroup {
			/// NavigationView
			PrimaryView(isShowingNewItemSheet: $isShowingNewItemSheet,
			            isShowingNewFolderSheet: $isShowingNewFolderSheet)

				/// This onReceive disables full screen mode, greying out the green button
				/// To be perfectly honest, though, I don't have a single fucking clue what this does
				.onReceive(NotificationCenter.default.publisher(for: NSApplication.willUpdateNotification), perform: { _ in
					for window in NSApplication.shared.windows { window.standardWindowButton(.zoomButton)?.isEnabled = false }
				})

				/// Framing for the app as a whole.
				/// Limits it pretty strongly as the app looks terrible when big
				.frame(minWidth: 400, idealWidth: 600, maxWidth: 900, minHeight: 300, idealHeight: 300, maxHeight: 500)
		}
		.commands {
			SidebarCommands()
			CommandGroup(replacing: CommandGroupPlacement.newItem) {
				Button("New Item") {
					isShowingNewItemSheet = true
				}.keyboardShortcut("n")

				Button("New Folder") {
					folderManagerActive = true
					folderSheetPresented = true
				}.keyboardShortcut("n", modifiers: [.command, .shift])
			}
		}

		/// Putting settings here allows for better-looking tabs and ⌘, by default
		Settings {
			SettingsView()
		}
	}
}
