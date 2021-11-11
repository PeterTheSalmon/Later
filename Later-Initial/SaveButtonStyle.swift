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
