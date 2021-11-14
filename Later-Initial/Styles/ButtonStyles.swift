//
//  SaveButtonStyle.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

import SwiftUI

struct SaveButton: ButtonStyle {
	var colour: Color

	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.frame(width: 150, height: 30)
			.background(configuration.isPressed ? Color.gray : colour)
			.cornerRadius(5)
	}
}

struct SocialButtonStyle: ButtonStyle {
	var gradient: [Color]

	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.clipShape(RoundedRectangle(cornerRadius: 5))
			.background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .topLeading, endPoint: .bottomTrailing))
			.scaleEffect(configuration.isPressed ? 1.15 : 1.0)
			.animation(.spring(), value: configuration.isPressed)
			.frame(width: 140, height: 40)
			.cornerRadius(5)
	}
}

// testing out the look
struct ButtonStyles_Previews: PreviewProvider {
	static var previews: some View {
		Button {} label: {
			HStack {
				Image("Discord")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 30, height: 30)
				Text("Discord")
					.font(.title2)
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
		}
		.buttonStyle(SocialButtonStyle(gradient: [.red, .blue]))
	}
}
