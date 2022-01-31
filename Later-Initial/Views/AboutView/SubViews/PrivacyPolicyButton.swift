//
//  PrivacyPolicyButton.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-31.
//

import SwiftUI

struct PrivacyPolicyButton: View {
	
	@Environment(\.openURL) var openURL
	
    var body: some View {
			Button("Privacy Policy") {
				openURL(URL(string: "https://google.ca")!)
			}
			.padding()
    }
}
