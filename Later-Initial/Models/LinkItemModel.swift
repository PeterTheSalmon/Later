//
//  LinkItemModel.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-10-30.
//

import Foundation

/// The basis for each link saved
struct LinkItem: Codable, Hashable, Identifiable {
	var id = UUID()
	var dateCreated = Date.now
	var title: String
	var url: String
	var isFavourite: Bool = false
	var parentFolder = FolderItem(name: "Uncategorized")
}

class LinkItems: ObservableObject {
	/// Example item for previews
	static let exampleItem = LinkItem(title: "Reddit", url: "https://www.reddit.com", isFavourite: true)

	/// List of link items used throughout the app
	@Published var ItemList = [LinkItem]() {
		didSet {
			if let encoded = try? JSONEncoder().encode(ItemList) {
				UserDefaults.standard.set(encoded, forKey: "Items")
			}
		}
	}

	/// decoding JSON of LinkItems
	init() {
		if let savedItems = UserDefaults.standard.data(forKey: "Items") {
			if let decodedItems = try? JSONDecoder().decode([LinkItem].self, from: savedItems) {
				ItemList = decodedItems
				return
			}
		}

		ItemList = []
	}
}
