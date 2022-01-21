//
//  TextFieldTest.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-21.
//

import SwiftUI

struct FloatingLabelTextField: View {
	let placeholder: String
	@Binding var text: String
	
    var body: some View {
			ZStack(alignment: .leading) {
				Text(placeholder)
					.foregroundColor(.blue.opacity(0.5))
					.offset(y: text.isEmpty ? 0: -25)
					.scaleEffect(text.isEmpty ? 1 : 0.9, anchor: .leading)
					.font(.system(text.isEmpty ? .title2 : .title3, design: .rounded))
				
				TextField("", text: $text)
					.textFieldStyle(.plain)
					.foregroundColor(.blue)
			}
			.padding(.top, text.isEmpty ? 0 : 18)
			.animation(.spring(), value: text.isEmpty)
			.padding()
			.background(
				RoundedRectangle(cornerRadius: 10)
					.stroke(text.isEmpty ? .blue.opacity(0.5) : .blue, lineWidth: 2)
				)
			.cornerRadius(10)
			.frame(height: 70)
    }
}

struct TextFieldTest_Previews: PreviewProvider {
    static var previews: some View {
			FloatingLabelTextField(placeholder: "", text: .constant("testing"))
    }
}
