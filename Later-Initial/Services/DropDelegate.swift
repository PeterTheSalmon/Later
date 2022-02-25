//
//  DropDelegate.swift
//  Later
//
//  Created by Peter Salmon on 2022-02-24.
//

import Foundation
import SwiftUI

struct ProjectDropDelegate: DropDelegate {
	var linkViewModel: LinkViewModel?
	var folderListViewModel: FolderListViewModel
	@Binding var folder: FolderViewModel

	func performDrop(info: DropInfo) -> Bool {
		if let linkViewModel = linkViewModel {
			if folder.folder.id != nil {
				var updatedLink = linkViewModel.link
				updatedLink.parentFolderId = folder.folder.id!
				linkViewModel.update(item: updatedLink)
				folderListViewModel.needsToReload.toggle()
				return true
			}
		}
		return false
	}
}
