//
//  LinkListViewModel.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-05.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation
import SwiftUI

/// This is the **LIST** ViewModel that handles the local logic
final class LinkListViewModel: ObservableObject {
	@Published var linkRepository = LinkRepository()

	// Can be subscribed to
	@Published var linkViewModels: [LinkViewModel] = []

	// Array of cancellables so we can cancel them later on
	private var cancellables: Set<AnyCancellable> = []
	
	func setDraggedLinkViewModel(linkViewModel: LinkViewModel) {
		draggedLinkViewModel = linkViewModel
	}
	@Published var draggedLinkViewModel: LinkViewModel?

	func add(_ item: LinkItem) {
		linkRepository.add(item)
	}

	init() {
		// map each link to create an array of LinkViewModels
		linkRepository.$links.map { links in
			links.map(LinkViewModel.init)
		}

		// Assign result of previous operation to linkViewModels
		.assign(to: \.linkViewModels, on: self)

		// Subscription is stored in cancellables so it auto-stops when LinkListViewModel is de-initialized
		.store(in: &cancellables)
	}
}
