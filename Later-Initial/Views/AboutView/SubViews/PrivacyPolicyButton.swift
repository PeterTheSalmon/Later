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
			Button {
				openURL(URL(string: "https://github.com/PeterTheSalmon/Later/blob/main/Later%20Privacy%20Policy%20-%20January%2031%202022.pdf")!)
			} label: {
				Text("Privacy Policy")
					.frame(width: 170)
			}
    }
}
