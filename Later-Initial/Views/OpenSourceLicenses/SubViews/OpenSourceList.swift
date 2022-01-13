//
//  OpenSourceList.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation
import SwiftUI

struct OpenSourceList: View {
	
	var openSourceItems: [License]
	
	var body: some View {
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
						.font(/*@START_MENU_TOKEN@*/ .headline/*@END_MENU_TOKEN@*/)
					Divider()
				}
				Text(row.name)
			}
		}
	}
}
