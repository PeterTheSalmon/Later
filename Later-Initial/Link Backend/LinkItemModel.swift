//
//  LinkItemModel.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-10-30.
//

import Foundation
import FirebaseFirestoreSwift


/// The basis for each link saved
struct LinkItem: Codable, Hashable, Identifiable {
	
	// UUID is saved as a string to allow Firestore syncing
	@DocumentID var id: String?
	
	var dateCreated = Date.now
	var title: String
	var url: String
	var isFavourite: Bool = false
	var parentFolderId: String
	var archived: Bool = false
	var userId: String?
}

