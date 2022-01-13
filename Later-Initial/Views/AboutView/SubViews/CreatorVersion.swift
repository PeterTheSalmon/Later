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
		Text("""
		Created by \(AppInfo.creator)
		\(AppInfo.version)
		""")
		.padding()
	}
}
