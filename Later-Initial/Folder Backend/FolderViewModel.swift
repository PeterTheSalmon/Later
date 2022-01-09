//
//  FolderViewModel.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-05.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

final class FolderViewModel: ObservableObject, Identifiable, Hashable {
	// For equatable
	static func == (lhs: FolderViewModel, rhs: FolderViewModel) -> Bool {
		return lhs.folder == rhs.folder && lhs.id == rhs.id
	}
	
	// For hashable
	func hash(into hasher: inout Hasher) {
		hasher.combine(folder)
	}
	
	
	private let folderRepository = FolderRepository()

	@Published var folder: FolderItem

	private var cancellables: Set<AnyCancellable> = []

	var id = ""

	init(folder: FolderItem) {
		self.folder = folder

		// This is a binding for the link
		// Links the id to the id of the view model
		// cancellable so we can unsubscribe later
		$folder
			.compactMap { $0.id }
			.assign(to: \.id, on: self)
			.store(in: &cancellables)
	}
	
	func update(item: FolderItem) {
		folderRepository.update(item)
	}
	
	func remove() {
		folderRepository.remove(folder)
	}

}
