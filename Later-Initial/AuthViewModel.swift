//
//  AppViewModel.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-10.
//

import FirebaseAuth
import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
	let auth = Auth.auth()

	@Published var signedIn = false

	@Published var errorDescription: String?

	@Published var resetPassDescription: String?

	@AppStorage("homeViewSelected") var homeViewSelected = true
	@AppStorage("FolderListEmpty") var folderListIsEmpty = false
	
	var isSignedIn: Bool {
		return auth.currentUser != nil
	}

	func signIn(email: String, password: String) {
		errorDescription = nil

		auth.signIn(withEmail: email, password: password) { [weak self] result, error in
			guard result != nil, error == nil else {
				self?.errorDescription = error?.localizedDescription
				return
			}
			DispatchQueue.main.async {
				self?.signedIn = true
			}
		}
	}

	func signUp(email: String, password: String) {
		errorDescription = nil

		auth.createUser(withEmail: email, password: password) { [weak self] result, error in
			guard result != nil, error == nil else {
				self?.errorDescription = error?.localizedDescription
				return
			}

			DispatchQueue.main.async {
				self?.signedIn = true
			}
		}
		homeViewSelected = true
		folderListIsEmpty = true
		
	}

	/// - Parameter email: user email
	func resetPassword(email: String) {
		auth.sendPasswordReset(withEmail: email) { [weak self] error in
			guard error == nil else {
				withAnimation(.linear) { self?.resetPassDescription = error!.localizedDescription }
				return
			}
		}
		withAnimation(.linear) { resetPassDescription = nil }
	}

	func signOut() {
		// Try to sign out
		try? auth.signOut()

		// mark user as signed out
		signedIn = false
	}
}
