//
//  LinkViewModel.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-05.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

// Observable to emit changes. Identifiable so we can iterate over an array of links
final class LinkViewModel: ObservableObject, Identifiable {
	private let linkRepository = LinkRepository()

	@Published var link: LinkItem

	private var cancellables: Set<AnyCancellable> = []

	var id = ""

	init(link: LinkItem) {
		self.link = link

		// This is a binding for the link
		// Links the id to the id of the view model
		// cancellable so we can unsubscribe later
		$link
			.compactMap { $0.id }
			.assign(to: \.id, on: self)
			.store(in: &cancellables)
	}
	
	func update(item: LinkItem) {
		linkRepository.update(item)
	}
	
	func remove() {
		linkRepository.remove(link)
	}
	
}
