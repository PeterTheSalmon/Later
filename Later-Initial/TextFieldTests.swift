//
//  TextFieldTests.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-21.
//

import SwiftUI

struct TextFieldTests: View {
	
	@State private var text1 = ""
	@State private var text2 = ""
	
    var body: some View {
			VStack {
				TextField("", text: $text1)
					.textFieldStyle(FloatingLabelTextFieldStyle(placeholder: "Email", isEmpty: text1.isEmpty))
			}
    }
}

struct TextFieldTests_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldTests()
    }
}
