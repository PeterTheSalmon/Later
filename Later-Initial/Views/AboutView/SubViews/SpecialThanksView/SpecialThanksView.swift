//
//  SpecialThanksView.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-31.
//

import SwiftUI

struct SpecialThanksView: View {
	var body: some View {
		VStack {
			VStack(alignment: .leading) {
				Text("Special Thanks To:")
					.font(.largeTitle)
					.fontWeight(.bold)
					.foregroundColor(.orange)
					.padding(.bottom)
				Text(
"""
[Undraw](https://undraw.co/) for their illustrations
[Paul Hudson](https://www.hackingwithswift.com/) for his invaluable guides and tutorials
[Sean Allen](https://seanallen.co/) for introducing me to Swift and SwiftUI

And you, of course! Thank you for using Later.
"""
				)
			}
			Image("Code Review")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 300, height: 210)
		}
		.padding()
		.frame(width: 320, height: 430)
	}
}
