//
//  Later_InitialApp.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-10-30.
//

import SwiftUI

// main program
@main
struct Later_Initial: App {
	
	@State var isShowingNewFolderSheet = false
	@State var isShowingNewItemSheet = false
	
	var body: some Scene {
		WindowGroup {
			PrimaryView(isShowingNewItemSheet: $isShowingNewItemSheet, isShowingNewFolderSheet: $isShowingNewFolderSheet)
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
	}
}
