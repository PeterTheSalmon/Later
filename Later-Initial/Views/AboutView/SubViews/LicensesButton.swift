//
//  LicensesButton.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation
import SwiftUI

struct LicensesButton: View {
	var body: some View {
		Button {
			OpenSourceLicenses().openInWindow(title: "Open Source Licenses", sender: self)
		} label: {
			Text("Open Source Licenses")
				.frame(width: 170)
		}

	}
}
