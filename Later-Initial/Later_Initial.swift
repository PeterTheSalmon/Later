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
	var body: some Scene {
		WindowGroup {
			PrimaryView()
		}
		.commands {
			SidebarCommands()
		}
	}
}
