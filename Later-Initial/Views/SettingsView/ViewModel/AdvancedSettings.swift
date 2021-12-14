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
	@State var alertPresented = false

	var body: some View {
		VStack {
			Section("Danger Zone") {
				Button("Clear Statistics") { alertPresented = true }
			}
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

struct AdvancedSettings_Previews: PreviewProvider {
	static var previews: some View {
		AdvancedSettings()
	}
}
