//
//  FolderRepository.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-04.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

// Observable to emit changes
class FolderRepository: ObservableObject {
	// Firestore path
	private let path = "folders"

	// Firestore store
	private let store = Firestore.firestore()

	@Published var folders: [FolderItem] = []

	init() {
		get()
	}

	func get() {
		store.collection(path)
			.addSnapshotListener { querySnapshot, error in
				if let error = error {
					print("Error getting folders: \(error.localizedDescription)")
					return
				}

				self.folders = querySnapshot?.documents.compactMap { document in
					try? document.data(as: FolderItem.self)
				} ?? []
			}
	}

	// Function to add a LinkItem to the Firestore database
	func add(_ item: FolderItem) {
		do {
			try _ = store.collection(path).addDocument(from: item)
		} catch {
			// This kills the app. TODO: add alternative error handling
			fatalError("Unable to add link to database. Error message: \(error.localizedDescription)")
		}
	}
	
	func update(_ item: FolderItem) {
		guard let itemID = item.id else { return }
		
		do {
			// 3
			try store.collection(path).document(itemID).setData(from: item)
		} catch {
			fatalError("Unable to update folder: \(error.localizedDescription).")
		}
	}
	
	func remove(_ item: FolderItem) {
		guard let folderId = item.id else { return }
		
		store.collection(path).document(folderId).delete { error in
			if let error = error {
				print("Unable to remove folder: \(error.localizedDescription)")
			}
		}
	}
}
