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
				FloatingLabelTextField(placeholder: "Email", text: $text1)
				FloatingBorderLabelTextField(placeholder: "Password", text: $text2)
			}
    }
}

struct TextFieldTests_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldTests()
    }
}
