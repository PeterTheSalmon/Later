//
//  TimesOpenedMessage.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation
import SwiftUI

struct TimesOpenedMessage: View {
	
	var timesOpened: Int
	
	var body: some View {
		Text("**Fun Fact:** you've opened Later \(timesOpened) times.")
			.padding(.horizontal)
			.help("This was made simply to test @AppStorage")
	}
}
