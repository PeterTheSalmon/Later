//
//  PrivacyPolicyButton.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-31.
//

import SwiftUI

struct TermsOfUseButton: View {
	@Environment(\.openURL) var openURL

	var body: some View {
		Button {
			openURL(URL(string: "https://github.com/PeterTheSalmon/Later/blob/main/Later%20Terms%20of%20Use%20-%20January%2031%202022.pdf")!)
		} label: {
			Text("Terms of Use")
				.frame(width: 170)
		}
	}
}
