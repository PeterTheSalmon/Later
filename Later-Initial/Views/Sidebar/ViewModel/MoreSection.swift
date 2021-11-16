//
//  MoreSection.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation
import SwiftUI

struct MoreSection: View {
	@Binding var timesOpened: Int
	var activeFolderList: FolderClass
	@Binding var isShowingNewFolderSheet: Bool
	@Binding var isShowingSheet: Bool
	var listItems: MockData
	
	var body: some View {
		Section(header: Text("More")) {
			NavigationLink(destination: AboutView(
				timesOpened: $timesOpened,
				activeFolderList: activeFolderList,
				isShowingNewFolderSheet: $isShowingNewFolderSheet,
				isShowingSheet: $isShowingSheet,
				listItems: listItems
			)) {
				SidebarExtraItemView(name: "About", imageName: "info.circle")
			}
		}
	}
}
