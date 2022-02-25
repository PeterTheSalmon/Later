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
	@Binding var folder: FolderViewModel

	func performDrop(info: DropInfo) -> Bool {
		if let linkViewModel = linkViewModel {
			if folder.folder.id != nil {
				linkViewModel.link.parentFolderId = folder.folder.id!
				return true
			}
		}
		return false
	}
}
