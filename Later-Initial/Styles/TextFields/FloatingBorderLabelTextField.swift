//
//  TextFieldTest.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-21.
//

import SwiftUI

struct FloatingBorderLabelTextField: View {
	let placeholder: String
	@Binding var text: String

	@Environment(\.colorScheme) var colorScheme
	
	var body: some View {
		ZStack(alignment: .leading) {
			Text(placeholder)
				.font(.system(text.isEmpty ? .title2 : .title3, design: .rounded))
				.foregroundColor(.accentColor.opacity(0.5))
				.padding(.horizontal, text.isEmpty ? 0 : 10)
				.background(Color("DefaultBG"))
				.offset(y: text.isEmpty ? 0 : -24)
				.scaleEffect(text.isEmpty ? 1 : 0.9, anchor: .leading)

			TextField("", text: $text)
				.textFieldStyle(.plain)
				.font(.system(.title2, design: .rounded))
				.foregroundColor(.accentColor)
		}
		.animation(.easeInOut(duration: Constants().animationTime * 2.5), value: text.isEmpty)
		.padding(.horizontal)
		.padding(.vertical, 10)
		.background(
			RoundedRectangle(cornerRadius: 10)
				.stroke(text.isEmpty ? Color.accentColor.opacity(0.5) : Color.accentColor, lineWidth: 2)
				.animation(.linear(duration: Constants().animationTime), value: text.isEmpty)
		)
	}
}

struct FloatingBorderText_Previews: PreviewProvider {
	static var previews: some View {
	FloatingBorderLabelTextField(placeholder: "", text: .constant("testing"))
	}
}
