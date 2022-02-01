//
//  UpdatesSettings.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-18.
//

import SwiftUI

struct UpdatesSettings: View {
	@State private var updatePromptShown = false
	@State private var spinnerShown = false

	@ObservedObject var versionViewModel = VersionViewModel()

	func checkForUpdates() {
		withAnimation(.linear(duration: Constants().animationTime)) {
			updatePromptShown = false
			spinnerShown = true
		}
		versionViewModel.getVersion()
		Task {
			try await Task.sleep(nanoseconds: 1_000_000_000)
			if versionViewModel.latestVersion != nil {
				if AppInfo.version != versionViewModel.latestVersion {
					AppInfo.latestVersion = versionViewModel.latestVersion
					withAnimation(.linear(duration: Constants().animationTime)) { updatePromptShown = true }
				}
			}
			withAnimation(.linear(duration: Constants().animationTime)) {
				spinnerShown = false
			}
		}
	}

	var body: some View {
		VStack {
			HStack {
				Text("Updates")
				Button("Check Now") { checkForUpdates() }.buttonStyle(.borderless)
			}
			Divider()

			Text("Current version: \(AppInfo.version)")

			VStack {
				if spinnerShown {
					ProgressView()
				} else {
					if updatePromptShown {
						UpdatePrompt()
					} else {
						Label("Up to Date", systemImage: "checkmark.seal.fill")
							.font(.title2)
							.foregroundColor(.green)
							.symbolRenderingMode(.multicolor)
							.padding()
						Text("[Click here to view all releases](https://github.com/PeterTheSalmon/Later/releases)")
					}
				}
			}
			.frame(width: 300, height: 150)
		}
		.onAppear {
			checkForUpdates()
		}
	}
}
