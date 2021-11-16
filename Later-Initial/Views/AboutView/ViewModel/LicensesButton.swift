//
//  LicensesButton.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation
import SwiftUI

struct LicenseseButton: View {
	var body: some View {
		Button("Open Source Licenses") {
			OpenSourceLicenses().openInWindow(title: "Open Source Licenses", sender: self)
		}
		.padding()
	}
}
