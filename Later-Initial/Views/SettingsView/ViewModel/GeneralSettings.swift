//
//  GeneralSettings.swift
//  Later
//
//  Created by Peter Salmon on 2021-12-12.
//

import SwiftUI

struct GeneralSettings: View {
	// If true, folders are deleted in one click
	@AppStorage("instantDeleteFolder") var instantDeleteFolder = false

	// If true, link items are deleted in one click
	@AppStorage("instantDeleteLink") var instantDeleteLink = false

	var body: some View {
		Form {
			Section("Folder and Links") {
				Toggle("Instantly delete folders", isOn: $instantDeleteFolder)
				Toggle("Instant delete links", isOn: $instantDeleteLink)
			}
		}
	}
}

struct GeneralSettings_Previews: PreviewProvider {
	static var previews: some View {
		GeneralSettings()
	}
}
