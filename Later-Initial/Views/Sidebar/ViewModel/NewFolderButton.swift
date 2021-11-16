//
//  NewFolderButton.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation
import SwiftUI

struct NewFolderButton: View {
	@Binding var isShowingNewFolderSheet: Bool
	var body: some View {
		HStack {
			Button {
				isShowingNewFolderSheet = true
			} label: {
				Label("New Folder", systemImage: "folder.badge.plus")
			}
			.buttonStyle(.borderless)
			
			Spacer()
		}
		.padding(.leading)
		.padding(.bottom, 10)
	}
}
