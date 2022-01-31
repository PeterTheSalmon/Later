//
//  TimesOpenedMessage.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation
import SwiftUI


/// Small text view to show the times the user has opened Later as well as the number of saved links and folders
struct StatisticsMessage: View {
	@AppStorage("timesOpened") var timesOpened = 0
	@AppStorage("notesCreated") var notesCreated = 0
	@AppStorage("folderCreated") var foldersCreated = 0

	var body: some View {
		VStack(alignment: .leading) {
			Text("**Fun Fact:** you've opened Later \(timesOpened) times.")

			Text("\(notesCreated) links saved | \(foldersCreated) folders created")
		}
		.padding(.horizontal)
	}
}
