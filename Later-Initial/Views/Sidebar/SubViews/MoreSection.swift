//
//  MoreSection.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation
import SwiftUI

struct MoreSection: View {
	@ObservedObject var folderListViewModel: FolderListViewModel
	@ObservedObject var linkListViewModel: LinkListViewModel
	
	@Binding var isShowingNewFolderSheet: Bool
	@Binding var isShowingSheet: Bool
	@Binding var query: String
	@Binding var justDeletedFolder: Bool

	var body: some View {
		Section(header: Text("More")) {
			NavigationLink(destination: AboutView(
				folderListViewModel: folderListViewModel,
				linkListViewModel: linkListViewModel,
				isShowingNewFolderSheet: $isShowingNewFolderSheet,
				justDeletedFolder: $justDeletedFolder
			)) {
				SidebarExtraItemView(name: "About", imageName: Icons().info)
			}
		}
	}
}
