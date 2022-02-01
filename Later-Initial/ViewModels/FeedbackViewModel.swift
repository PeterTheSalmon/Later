//
//  FeedbackViewModel.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-31.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

struct Feedback: Codable {
	var title: String
	var email: String
	var message: String
}

final class FeedbackViewModel: ObservableObject {
	@Published var resultMessage: String?

	func sendFeedback(feedback: Feedback) {
		let store = Firestore.firestore()

		_ = store.collection("feedback")
			.addDocument(data: [
				"title": feedback.title,
				"email": feedback.email,
				"message": feedback.message,
			]) { error in
				if let error = error {
					self.resultMessage = error.localizedDescription
					print(error.localizedDescription)
				} else {
					return
				}
			}
	}
}
