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
	
	var body: some View {
		VStack(alignment: .leading) {
			AboutTitle()

			CreatorVersion()

			AppDescription()

			SocialButtons()

			TimesOpenedMessage(timesOpened: timesOpened)

			LicenseseButton()
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
			ToolbarItem(placement: .navigation) {
				Button {
					isShowingSheet = true
				} label: {
					Image(systemName: "plus.circle.fill")
				}
				.help("New Item")
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
		AboutView(timesOpened: .constant(4), activeFolderList: FolderClass(), isShowingNewFolderSheet: .constant(false), isShowingSheet: .constant(false), listItems: MockData())
	}
}
