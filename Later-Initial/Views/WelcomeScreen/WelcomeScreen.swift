//
//  WelcomeScreen.swift
//  Later
//
//  Created by Peter Salmon on 2021-12-02.
//

import SwiftUI

struct WelcomeScreen: View {
	@Binding var newUserValue: Bool
	@AppStorage("FolderListEmpty") var folderListIsEmpty = false
	@ObservedObject var folderListViewModel = FolderListViewModel()
	var body: some View {
		VStack {
			Text("Welcome to Later")
				.font(.largeTitle)
				.fontWeight(.semibold)
			Text("\(AppInfo.version)")
				.font(.title3)
			HStack { /// Elements
				VStack {
					WelcomeScreenElement(title: "Save Links",
					                     description: Text("Easily record and access links for later use"),
					                     imageName: "link.badge.plus",
					                     imageColour: .orange)
					WelcomeScreenElement(title: "Categorize and Favourite",
					                     description: Text("Use folders and favourites to organize your links"),
					                     imageName: "folder",
					                     imageColour: .green)

				}
				VStack {
					WelcomeScreenElement(title: "Search and copy",
															 description: Text("Search links and click \(Image(systemName: Icons().copy)) copy to grab the link"),
					                     imageName: "magnifyingglass",
					                     imageColour: .red)

					WelcomeScreenElement(title: "More to Come",
					                     description: Text("Later is still in beta, so you can expect more features on a regular basis"),
					                     imageName: "square.and.arrow.down",
					                     imageColour: .teal)
				}
			}
			.frame(alignment: .leading)
			Button {
				newUserValue = false
			} label: {
				Text("Get Started")
					.font(.title2)
					.frame(maxWidth: .infinity, maxHeight: .infinity)
			}
			.buttonStyle(SocialButtonStyle(gradient: [.accentColor]))
			.padding(.top, 10)
		}
		.padding()
	}
}

struct WelcomeScreen_Previews: PreviewProvider {
	static var previews: some View {
		WelcomeScreen(newUserValue: .constant(true))
	}
}
