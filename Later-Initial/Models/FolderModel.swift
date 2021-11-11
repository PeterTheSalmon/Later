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
	@Published var folderList: [FolderItem] = [
		FolderItem(name: "Uncategorized")
	]
}

