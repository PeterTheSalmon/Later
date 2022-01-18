//
//  UpdatePrompt.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-18.
//

import SwiftUI

struct UpdatePrompt: View {
	@Environment(\.openURL) var openURL

	var body: some View {
		VStack {
			Text("A new update is available!")
				.font(.title3)
				.fontWeight(.semibold)
			Text("You are using version \(AppInfo.version) and the latest version is \(AppInfo.latestVersion ?? "ERROR")")
			Button("Download from Github") { openURL(URL(string: "https://github.com/PeterTheSalmon/Later/releases/latest/")!) }
				.buttonStyle(SaveButton(colour: .accentColor))
		}
		.padding()
		.overlay(
			RoundedRectangle(cornerRadius: 5, style: .continuous)
				.stroke(LinearGradient(colors: [.red, .orange], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3)
		)

		.frame(width: 300)
	}
}

struct UpdatePrompt_Previews: PreviewProvider {
	static var previews: some View {
		UpdatePrompt()
	}
}
