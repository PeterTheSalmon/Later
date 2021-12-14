//
//  SettingsView.swift
//  Later
//
//  Created by Peter Salmon on 2021-12-12.
//

import SwiftUI

struct SettingsView: View {
	private enum Tabs: Hashable {
		case general, advanced
	}

	var body: some View {
		TabView {
			GeneralSettings()
				.tabItem {
					Label("General", systemImage: "gear")
				}
			AdvancedSettings()
				.tabItem {
					Label("Advanced", systemImage: "wrench.and.screwdriver")
				}
		}
		.padding(20)
		.frame(width: 375, height: 150)
	}
}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}
