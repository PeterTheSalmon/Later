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
	/// These states are declared here as they are used in keyboard shortcuts to open the folder and link sheets
	@State var isShowingNewFolderSheet = false
	@AppStorage("isShowingNewItemSheet") var isShowingNewItemSheet = false

	/// Used to ensure different parts of the UI are activated
	@AppStorage("folderManagerActive") var folderManagerActive = false
	@AppStorage("homeViewSelected") var homeViewSelected = true
	@AppStorage("folderSheetPresented") var folderSheetPresented = false



	init() {
		folderManagerActive = false
		homeViewSelected = true
		FirebaseApp.configure()
		isShowingNewItemSheet = false
	}

	var body: some Scene {
		let linkListViewModel = LinkListViewModel()
		let folderListViewModel = FolderListViewModel()
		let authViewModel = AuthViewModel()
		WindowGroup {
			/// Shows either the login page or the main navigationView
			PrimaryView(linkListViewModel: linkListViewModel,
			            folderListViewModel: folderListViewModel,
			            isShowingNewItemSheet: $isShowingNewItemSheet,
			            isShowingNewFolderSheet: $isShowingNewFolderSheet)
				.environmentObject(authViewModel)

				/// This onReceive disables full screen mode, greying out the green button
				/// To be perfectly honest, though, I don't have a single fucking clue what this does
				.onReceive(NotificationCenter.default.publisher(for: NSApplication.willUpdateNotification), perform: { _ in
					for window in NSApplication.shared.windows { window.standardWindowButton(.zoomButton)?.isEnabled = false }
				})

				/// Framing for the app as a whole.
				/// Limits it pretty strongly as the app looks terrible when big
				.frame(minWidth: 400, idealWidth: 600, maxWidth: 900, minHeight: 300, idealHeight: 300, maxHeight: 500)
		}
		
		.windowToolbarStyle(.unified)
		
		.commands {
			SidebarCommands()
			CommandGroup(replacing: CommandGroupPlacement.newItem) {
				Button("New Item") {
					isShowingNewItemSheet = true
				}
				.keyboardShortcut("n")

				Button("New Folder") {
					folderManagerActive = true
					folderSheetPresented = true
				}
				.keyboardShortcut("n", modifiers: [.command, .shift])
			}
		}

		/// Putting settings here allows for better-looking tabs and ⌘, by default
		Settings {
			SettingsView()
				.environmentObject(authViewModel)
				.environmentObject(linkListViewModel)
				.environmentObject(folderListViewModel)
		}
	}
}
