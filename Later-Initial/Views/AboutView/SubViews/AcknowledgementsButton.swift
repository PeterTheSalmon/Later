//
//  PrivacyPolicyButton.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-31.
//

import SwiftUI

struct AcknowledgementsButton: View {

	var body: some View {
		Button {
			SpecialThanksView().openInWindow(title: "Acknowledgements", sender: self)
		} label: {
			Text("Acknowledgements")
				.frame(width: 170)
		}
	}
}
