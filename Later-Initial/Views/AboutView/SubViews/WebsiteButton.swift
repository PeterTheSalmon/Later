//
//  PrivacyPolicyButton.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-31.
//

import SwiftUI

struct WebsiteButton: View {
	
	@Environment(\.openURL) var openURL
	
    var body: some View {
			Button {
				openURL(URL(string: "https://sites.google.com/view/peter-salmon-dev/home")!)
			} label: {
				Text("Visit my Website")
					.frame(width: 170)
			}
    }
}
