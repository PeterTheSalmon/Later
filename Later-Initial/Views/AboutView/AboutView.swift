//
//  AboutView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-10.
//

/// this is just here for info and advertising, basically :)

import SwiftUI

extension Color {
	static var random: Color {
		return Color(red: .random(in: 0 ... 1), green: .random(in: 0 ... 1), blue: .random(in: 0 ... 1), opacity: 1)
	}
}

struct AboutView: View {
	@ObservedObject var folderListViewModel: FolderListViewModel
	@ObservedObject var linkListViewModel: LinkListViewModel

	@Binding var isShowingNewFolderSheet: Bool
	@Binding var justDeletedFolder: Bool
	@AppStorage("isShowingNewItemSheet") var isShowingNewItemSheet = false

	@State private var stellaBorderColour = Color.white

	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				HStack {
					VStack(alignment: .leading) {
						AboutTitle()

						CreatorVersion()
					}
					.padding(.trailing)
					VStack {
						Image("Stella")
							.resizable()
							.frame(width: 120, height: 120)
							.clipShape(Circle())
							.overlay {
								Circle().stroke(stellaBorderColour, lineWidth: 4)
							}
							.shadow(radius: 4)
							.onTapGesture {
								withAnimation(.spring()) {
									stellaBorderColour = Color.random
								}
							}
							.onLongPressGesture {
								GameView().openInWindow(title: "???", sender: self)
							}
						Text("Stella the Dog")
					}
				}
				.padding(.bottom)
				AppDescription()

				SocialButtons()

				StatisticsMessage()

				Spacer().frame(height: 10)
			}

			Divider().padding(.vertical)

			VStack {
				LicensesButton()
				PrivacyPolicyButton()
				TermsOfUseButton()
				WebsiteButton()
				AcknowledgementsButton()
			}.padding()
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
