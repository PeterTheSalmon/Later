//
//  OpenSourceLicenses.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-15.
//

import SwiftUI

struct OpenSourceLicenses: View {
	let openSourceItems: [License] = [.CachedAsyncImage]

	var body: some View {
		VStack(alignment: .leading) {
			Text("Open Source Licenses")
				.font(.title)

			Divider()

			OpenSourceList(openSourceItems: openSourceItems)
		}
		.padding()
		.frame(minWidth: 500, minHeight: 500)
	}
}

struct OpenSourceLicenses_Previews: PreviewProvider {
	static var previews: some View {
		OpenSourceLicenses()
	}
}
