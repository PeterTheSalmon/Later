//
//  AdvancedSettings.swift
//  Later
//
//  Created by Peter Salmon on 2021-12-13.
//

import SwiftUI

struct AdvancedSettings: View {
	@AppStorage("notesCreated") var notesCreated = 0
	@AppStorage("folderCreated") var foldersCreated = 0
	@AppStorage("timesOpened") var timesOpened = 0
	@State private var alertPresented = false
	@State private var introSheetPresented = false

	var body: some View {
		Form {
			Section("General") {
				Divider()
				Button("Replay Intro") {
					introSheetPresented = true
				}
			}

			Section("Danger Zone") {
				Divider()
				Button("Clear Statistics") { alertPresented = true }
			}
		}
		.sheet(isPresented: $introSheetPresented) {
			WelcomeScreen(newUserValue: $introSheetPresented)
		}
		.alert("Clear statistics? This cannot be undone", isPresented: $alertPresented) {
			Button("Confirm", role: .destructive) {
				notesCreated = 0
				foldersCreated = 0
				timesOpened = 0
			}
		}
	}
}
