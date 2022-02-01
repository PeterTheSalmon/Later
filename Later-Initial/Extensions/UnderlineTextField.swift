//
//  UnderlineTextField.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-31.
//

import Foundation
import SwiftUI

extension View {
	func underlineTextField(colour: Color) -> some View {
		padding(.vertical, 10)
			.overlay(Rectangle().fill(Color.secondary).frame(height: 2).padding(.top, 35))
			.foregroundColor(colour)
	}
}
