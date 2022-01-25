//
//  FloatingBorderLabelTextFieldStyle.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-21.
//

import Foundation
import SwiftUI

struct FloatingLabelTextFieldStyle: TextFieldStyle {
	let placeholder: String
	
	var isEmpty: Bool
	
	var colour: Color = Color.accentColor
	
	var imageName: String?
	
	func _body(configuration: TextField<_Label>) -> some View {
		ZStack(alignment: .leading) {
			Text(placeholder)
				.font(.system(isEmpty ? .title2 : .title3, design: .rounded))
				.foregroundColor(colour.opacity(0.5))
				.background(Color("DefaultBG"))
				.offset(y: isEmpty ? 0 : -20)
				.scaleEffect(isEmpty ? 1 : 0.9, anchor: .leading)
			
			configuration
				.textFieldStyle(.plain)
				.font(.system(.title2, design: .rounded))
				.foregroundColor(colour)
		}
		.animation(.easeInOut(duration: Constants().animationTime * 2.5), value: isEmpty)
		.padding(.vertical, 5)
		.padding(.top, 8)
		.background(
			
			VStack {
				Spacer()
				isEmpty ? colour.opacity(0.5)
					.frame(height: 2)
					.cornerRadius(10)
					.animation(.linear(duration: Constants().animationTime), value: isEmpty)
				:
				colour
					.frame(height: 2)
					.cornerRadius(10)
					.animation(.linear(duration: Constants().animationTime), value: isEmpty)
			}.padding(.horizontal, -2)
		)
	}
}
