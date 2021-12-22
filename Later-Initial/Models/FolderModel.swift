//
//  FolderModel.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

import Foundation
import SwiftUI

/// Basis for all folders
///
/// TODO: add custom colours and icons
struct FolderItem: Codable, Hashable, Identifiable {	
	var id = UUID()
	var name: String
	var colour: Color?
}

/// Class containing the list of folders for use in the app
class FolderClass: ObservableObject {
	@Published var folderList: [FolderItem] = [FolderItem(name: "Uncategorized")] {
		didSet {
			if let encoded = try? JSONEncoder().encode(folderList) {
				UserDefaults.standard.set(encoded, forKey: "Folders")
			}
		}
	}

	init() {
		if let savedItems = UserDefaults.standard.data(forKey: "Folders") {
			if let decodedItems = try? JSONDecoder().decode([FolderItem].self, from: savedItems) {
				folderList = decodedItems
				return
			}
		}

		folderList = [FolderItem(name: "Uncategorized")]
	}
}
