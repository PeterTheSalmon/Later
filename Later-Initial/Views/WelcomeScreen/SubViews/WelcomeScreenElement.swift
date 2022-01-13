//
//  WelcomeScreenElement.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-09.
//

import Foundation
import SwiftUI

struct WelcomeScreenElement: View {
	var title: String
	var description: Text
	var imageName: String
	var imageColour: Color
	
	var body: some View {
		HStack {
			Image(systemName: imageName)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 30, height: 30)
				.foregroundColor(imageColour)
			VStack(alignment: .leading) {
				Text(title)
					.font(.title2)
					.fontWeight(.medium)
				description
					.fixedSize(horizontal: false, vertical: true)
					.frame(width: 300, alignment: .leading)
			}
		}
		.frame(height: 50, alignment: .leading)
	}
}
