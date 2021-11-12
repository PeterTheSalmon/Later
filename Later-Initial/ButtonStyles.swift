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

struct SocialButton: View {
	
	@Environment(\.openURL) var openURL
	@State var isHovering = false
	
	var gradientColourOne: Color
	var gradientColourTwo: Color
	var title: String
	var image: String
	var url: String
	
	var body: some View {
		ZStack {
			
			LinearGradient(colors: [gradientColourOne, gradientColourTwo],
						   startPoint: .topLeading, endPoint: .bottomTrailing)
			HStack() {
				Image(image)
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 30, height: 30)
				
				Text(title)
					.font(.title2)
			}
			
		}
		.frame(width: 140, height: 40)
		.cornerRadius(5)
		.help("Click to open!")
		.onTapGesture {
			openURL(URL(string: url)!)
		}

		.onHover { inside in
			if inside {
				NSCursor.pointingHand.push()
			} else {
				NSCursor.pop()
			}
		}
		//.animation(.linear(duration: 0.2), value: isHovering)
	}
	
}

// testing out the look
struct ButtonStyles_Previews: PreviewProvider {
	static var previews: some View {
		SocialButton(gradientColourOne: .green, gradientColourTwo: .blue, title: "Test", image: "GitHub", url: "https://reddit.com")
		SocialButton(gradientColourOne: .orange, gradientColourTwo: .red, title: "Reddit", image: "Discord", url: "https://reddit.com")
	}
}
