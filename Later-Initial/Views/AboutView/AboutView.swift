//
//  AboutView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-10.
//

/// this is just here for info and advertising, basically :)

import SwiftUI

struct AboutView: View {
	@ObservedObject var folderListViewModel: FolderListViewModel
	@ObservedObject var linkListViewModel: LinkListViewModel

	@AppStorage("timesOpened") var timesOpened = 0
	@Binding var isShowingNewFolderSheet: Bool
	@Binding var justDeletedFolder: Bool
	@AppStorage("isShowingNewItemSheet") var isShowingNewItemSheet = false

	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				AboutTitle()

				CreatorVersion()

				AppDescription()

				SocialButtons()

				StatisticsMessage(timesOpened: timesOpened)
			}
			
			Divider().padding()
			
			VStack { // Buttons
				LicensesButton()
			}
		}

		.sheet(isPresented: $isShowingNewItemSheet) {
			NewItemSheet(folderListViewModel: folderListViewModel,
			             parentFolderViewModel: folderListViewModel.folderViewModels[0],
			             linkListViewModel: linkListViewModel)
		}
		.toolbar { GenericToolbar() }
		.navigationTitle("About")
	}
}
