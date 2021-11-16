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

			List(openSourceItems, children: \.description) { row in
				VStack(alignment: .leading) {
					if row.url != nil {
						Link("Homepage", destination: row.url!)
							.onHover { inside in
								if inside {
									NSCursor.pointingHand.push()
								} else {
									NSCursor.pop()
								}
							}
							.font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
						Divider()
					}
					Text(row.name)
				}
			}
		}
		.padding()
		.frame(minWidth: 500, minHeight: 500)
	}
}

struct License: Identifiable {
	let id = UUID()
	let name: String
	var url: URL?
	var description: [License]?

	static let CachedAsyncImage = License(name: "CachedAsyncImage",
	                                      description: [License(name: """
	                                                            MIT License

	                                                            Copyright (c) 2021 Lorenzo Fiamingo

	                                                            Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

	                                                            The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

	                                                            THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	                                                            """,
	                                                            url: URL(string: "https://github.com/lorenzofiamingo/SwiftUI-CachedAsyncImage"))])
}

struct OpenSourceLicenses_Previews: PreviewProvider {
	static var previews: some View {
		OpenSourceLicenses()
	}
}
