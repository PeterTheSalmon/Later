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
			.frame(width: 160, height: 30)
			.background(configuration.isPressed ? Color.gray : colour)
			.scaleEffect(configuration.isPressed ? 1.15 : 1.0)
			.animation(.spring(), value: configuration.isPressed)
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

struct DisplaySheetButtonStyle: ButtonStyle {
	var hoveringReference: Bool
	var item: LinkItem
	
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.foregroundColor(configuration.isPressed ? .white : hoveringReference ? .gray : Color("Icon"))
			.animation(.linear(duration: Constants().animationDuration), value: hoveringReference)
		
	}
}
