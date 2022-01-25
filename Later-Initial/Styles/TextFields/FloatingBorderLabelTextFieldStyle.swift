//
//  FloatingBorderLabelTextFieldStyle.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-21.
//

import Foundation
import SwiftUI

struct FloatingBorderLabelTextFieldStyle: TextFieldStyle {
	let placeholder: String
	
	var isEmpty: Bool
	
	func _body(configuration: TextField<_Label>) -> some View {
		ZStack(alignment: .leading) {
			Text(placeholder)
				.font(.system(isEmpty ? .title2 : .title3, design: .rounded))
				.foregroundColor(.accentColor.opacity(0.5))
				.padding(.horizontal, isEmpty ? 0 : 10)
				.background(Color("DefaultBG"))
				.offset(y: isEmpty ? 0 : -16)
				.scaleEffect(isEmpty ? 1 : 0.9, anchor: .leading)
			
			configuration
				.textFieldStyle(.plain)
				.font(.system(.title2, design: .rounded))
				.foregroundColor(.accentColor)
		}
		.animation(.easeInOut(duration: Constants().animationTime * 2.5), value: isEmpty)
		.padding(.horizontal, 10)
		.padding(.vertical, 5)
		.background(
			RoundedRectangle(cornerRadius: 10)
				.stroke(isEmpty ? Color.accentColor.opacity(0.5) : Color.accentColor, lineWidth: 2)
				.animation(.linear(duration: Constants().animationTime), value: isEmpty)
		)
	}
}
