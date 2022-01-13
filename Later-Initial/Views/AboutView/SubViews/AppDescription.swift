//
//  AppDescription.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation
import SwiftUI

struct AppDescription: View {
	var body: some View {
		Text(AppInfo.description)
			.padding(.horizontal)
			.padding(.bottom)
			.frame(minWidth: 300, maxWidth: 400, alignment: .leading)
	}
}
