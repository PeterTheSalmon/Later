//
//  LinkItemModel.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-10-30.
//

import Foundation
import SwiftUI

struct LinkItem: Codable, Hashable, Identifiable {
	var id = UUID()
	var title: String
	var url: String
	var isFavourite: Bool = false
	var parentFolder: FolderItem = FolderItem(name: "Uncategorized")
	
}

class MockData: ObservableObject {
	// example item for previews and such
	static let exampleItem = LinkItem(title: "Reddit", url: "https://www.reddit.com", isFavourite: true)
	
	// general list of stuff
	@Published var ItemList: [LinkItem] = []
}
