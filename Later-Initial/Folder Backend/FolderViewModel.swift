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

class FolderViewModel: ObservableObject, Identifiable {
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
