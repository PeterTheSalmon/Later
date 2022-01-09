//
//  NewFolderButton.swift
//  Later
//
//  Created by Peter Salmon on 2021-11-15.
//

import Foundation
import SwiftUI

struct NewFolderButton: View {
	
	@AppStorage("folderManagerActive") var folderManagerActive = false
	@AppStorage("folderSheetPresented") var folderSheetPresented = false
	
	var body: some View {
		HStack {
			Button {
				folderManagerActive = true
				folderSheetPresented = true
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
