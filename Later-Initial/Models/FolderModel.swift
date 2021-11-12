//
//  FolderModel.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

import Foundation

struct FolderItem: Codable, Hashable, Identifiable {
	var id = UUID()
	var name: String
}

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
