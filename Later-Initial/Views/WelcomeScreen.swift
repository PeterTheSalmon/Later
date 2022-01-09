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
					WelcomeScreenElement(title: "Customize and colourize",
					                     description: Text("Click the \(Image(systemName: "pencil")) to change folder colours and icons"),
					                     imageName: "paintpalette",
					                     imageColour: .blue)
				}
				VStack {
					WelcomeScreenElement(title: "Search and copy",
					                     description: Text("Search links and click \(Image(systemName: "doc.on.doc")) copy to grab the link"),
					                     imageName: "magnifyingglass",
					                     imageColour: .red)
					WelcomeScreenElement(title: "Easy sorting",
					                     description: Text("Choose from three sorting methods to find whatever you are looking for"),
					                     imageName: "arrow.up.arrow.down",
					                     imageColour: .purple)
					WelcomeScreenElement(title: "More to Come",
					                     description: Text("Later is still in beta, so you can expect more features on a regular basis"),
					                     imageName: "square.and.arrow.down",
					                     imageColour: .teal)
				}
			}
			.frame(alignment: .leading)
			Button {
				newUserValue = false
				if folderListViewModel.folderViewModels.count == 0 {
					folderListIsEmpty = true
				}
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

struct WelcomeScreenElement: View {
	var title: String
	var description: Text
	var imageName: String
	var imageColour: Color

	var body: some View {
		HStack {
			Image(systemName: imageName)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 30, height: 30)
				.foregroundColor(imageColour)
			VStack(alignment: .leading) {
				Text(title)
					.font(.title2)
					.fontWeight(.medium)
				description
					.fixedSize(horizontal: false, vertical: true)
					.frame(width: 300, alignment: .leading)
			}
		}
		.frame(height: 50, alignment: .leading)
	}
}

struct WelcomeScreen_Previews: PreviewProvider {
	static var previews: some View {
		WelcomeScreen(newUserValue: .constant(true))
	}
}
