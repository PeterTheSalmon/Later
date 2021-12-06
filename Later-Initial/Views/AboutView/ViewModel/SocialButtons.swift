//
//  SocialButtons.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation
import SwiftUI

struct SocialButtons: View {
	
	@Environment(\.openURL) var openURL
	
	var body: some View {
		HStack {
			
			Button { openURL(URL(string: "https://github.com/PeterTheSalmon/Later")!) } label: {
				HStack {
					Image("GitHub")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 30, height: 30)
					Text("GitHub")
						.font(.title2)
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
			}
			.buttonStyle(SocialButtonStyle(gradient: [Color("GitHub 1"), Color("GitHub 2")]))
			.onHover { inside in
				if inside {
					NSCursor.pointingHand.push()
				} else {
					NSCursor.pop()
				}
			}
		}
		.padding()
	}
}
