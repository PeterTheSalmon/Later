//
//  AboutView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-10.
//

/// this is just here for info and advertising, basically :)

import SwiftUI

struct AboutView: View {
	@Binding var timesOpened: Int
	@ObservedObject var activeFolderList: FolderClass
	@Binding var isShowingNewFolderSheet: Bool
	@Binding var isShowingSheet: Bool
	@ObservedObject var listItems: MockData
	
	var tipList: [String]
	
	var body: some View {
		VStack(alignment: .leading) {
			Text("About Later")
				.font(.title)
				.fontWeight(.semibold)
				.foregroundColor(.accentColor)
				.padding(.horizontal)
			
			Text("""
			Created by \(AppInfo.creator)
			Version \(AppInfo.version)
			""")
			.padding()
			
			// Description
			Text(AppInfo.description)
				.padding(.horizontal)
				.padding(.bottom)
				.frame(minWidth: 300, maxWidth: 400, alignment: .leading)
			
			HStack {
				SocialButton(gradientColourOne: Color("Discord 1"),
				             gradientColourTwo: Color("Discord 2"),
				             title: "Discord",
				             image: "Discord",
				             url: "https://discord.gg/vCBAkhAgFn")
				
				SocialButton(gradientColourOne: Color("GitHub 1"),
				             gradientColourTwo: Color("GitHub 2"),
				             title: "GitHub",
				             image: "GitHub",
				             url: "https://github.com/PeterTheSalmon/Later")
			}
			.padding()
			
			Text("**Fun Fact:** you've opened Later \(timesOpened) times.")
				.padding(.horizontal)
				.help("This was made simply to test @AppStorage")
		}
		.sheet(isPresented: $isShowingNewFolderSheet) {
			NewFolderSheet(activeFolderList: activeFolderList)
		}
		.sheet(isPresented: $isShowingSheet) {
			NewItemSheet(listItems: listItems, activeFolderList: activeFolderList, parentFolder: activeFolderList.folderList[0])
		}
		.toolbar {
			ToolbarItem(placement: .navigation) {
				Button {
					toggleSidebar()
				} label: {
					Image(systemName: "sidebar.left")
				}
			}
		}
		.navigationTitle("Later")
	}
		
	private func toggleSidebar() {
		NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
	}
}

struct AboutView_Previews: PreviewProvider {
	static var previews: some View {
		AboutView(timesOpened: .constant(4), activeFolderList: FolderClass(), isShowingNewFolderSheet: .constant(false), isShowingSheet: .constant(false), listItems: MockData(), tipList: AppInfo.tips)
	}
}
