//
//  LinkRepository.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-04.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

// MARK: This is the repository that talks to the Firestore database

class LinkRepository: ObservableObject {
	// Firestore path
	private let path = "links"

	// Firestore store
	private let store = Firestore.firestore()

	// Published list of links for the app
	@Published var links: [LinkItem] = []

	// Get the links upon initialization
	init() {
		get()
	}

	func get() {
		store.collection(path)
			// Listen for changes from the store
			.addSnapshotListener { querySnapshot, error in

				// If an error occurs, print it
				if let error = error {
					print("Error getting links: \(error.localizedDescription)")
					return
				}

				// compactMap() looks at the documents from the query and iterates over
				// if the database is nil, we get an empty array
				self.links = querySnapshot?.documents.compactMap { document in

					// Using FirebaseFirestoreSwift and Codable we are able to directly map the documents to linkitems
					try? document.data(as: LinkItem.self)
				} ?? []
			}
	}

	// Function to add a LinkItem to the Firestore database
	func add(_ item: LinkItem) {
		do {
			try _ = store.collection(path).addDocument(from: item)
		} catch {
			// This kills the app. TODO: add alternative error handling
			fatalError("Unable to add link to database. Error message: \(error.localizedDescription)")
		}
	}

	func update(_ item: LinkItem) {
		/// Ensure the item id has a value, else abort the operation
		guard let itemID = item.id else { return }

		/// If anything goes wrong, terminate the app
		do {
			/// Use the path and document id to find the card in the database and edit it
			try store.collection(path).document(itemID).setData(from: item)
		} catch {
			fatalError("Unable to update link: \(error.localizedDescription)")
		}
	}
}
