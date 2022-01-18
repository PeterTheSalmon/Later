//
//  AppearanceSettings.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-09.
//

import SwiftUI

struct AppearanceSettings: View {
	@AppStorage("roundIcons") var roundIcons = false
	@AppStorage("animationDuration") var animationDuration: Double = 0.1
	@AppStorage("showFavicon") var showFavicon = true


	var body: some View {
		Form {
			Toggle("Prefer circular icons when possible", isOn: $roundIcons)
			
			Toggle("Show website favicons", isOn: $showFavicon)

			Divider()

			HStack {
				
				Text("Animation Duration")
				Text("\(animationDuration, specifier: "%.2f") seconds")
					.foregroundColor(.secondary)
			}
			Slider(value: $animationDuration, in: 0 ... 1, step: 0.1)

		}
	}
}

struct AppearanceSettings_Previews: PreviewProvider {
	static var previews: some View {
		AppearanceSettings()
	}
}
