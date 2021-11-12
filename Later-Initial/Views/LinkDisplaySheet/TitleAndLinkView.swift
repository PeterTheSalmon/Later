//
//  TitleAndLinkView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-08.
//

import Foundation
import SwiftUI

struct TitleLink: View {
	var subItem: LinkItem
	
	@Environment(\.openURL) var openURL
	
	var body: some View {
		VStack(alignment: .leading, spacing: 1.5) {
			Text(subItem.title)
				.font(.title2)
				.fontWeight(.medium)
				.lineLimit(1)
				.foregroundColor(Color("Text"))
			
			Text(subItem.url)
				.lineLimit(1)
				.foregroundColor(.accentColor)
				.onTapGesture {
					openLink(urlString: subItem.url)
				}
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
	
	func openLink(urlString: String) {
		guard let url = URL(string: urlString) else {
			return
		}
		openURL(url)
	}
}
