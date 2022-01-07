//
//  FolderListViewModel.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-05.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

class FolderListViewModel: ObservableObject, Hashable {
	static func == (lhs: FolderListViewModel, rhs: FolderListViewModel) -> Bool {
		return lhs.folderViewModels == rhs.folderViewModels
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(folderViewModels)
	}
	
	@Published var folderRepository = FolderRepository()

	// Can be subscribed to
	@Published var folderViewModels: [FolderViewModel] = []

	// Array of cancellables so we can cancel them later on
	private var cancellables: Set<AnyCancellable> = []

	init() {
		// 1
		folderRepository.$folders.map { folders in
			folders.map(FolderViewModel.init)
		}
		// 2
		.assign(to: \.folderViewModels, on: self)
		// 3
		.store(in: &cancellables)
	}

	func add(_ item: FolderItem) {
		folderRepository.add(item)
	}
}
