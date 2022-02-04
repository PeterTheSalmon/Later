//
//  CreatorVersion.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation
import SwiftUI

struct CreatorVersion: View {
	var body: some View {
		VStack(alignment: .leading) {
			Text("Created by \(AppInfo.creator)")
			Text(AppInfo.version)
		}
		.padding()
	}
}
