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
	
	
	
	var isSignedIn: Bool {
		return auth.currentUser != nil
	}

	func signIn(email: String, password: String) {
		self.errorDescription = nil
		
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
		self.errorDescription = nil
		
		auth.createUser(withEmail: email, password: password) { [weak self] result, error in
			guard result != nil, error == nil else {
				self?.errorDescription = error?.localizedDescription
				return
			}

			DispatchQueue.main.async {
				self?.signedIn = true
			}
		}
	}
	
	
	/// UNFINISHED
	/// - Parameter email: user email
	func resetPassword(email: String) {
		
		self.errorDescription = nil
		
		auth.sendPasswordReset(withEmail: email) { [weak self] error in
			guard error == nil else {
				self?.errorDescription = error?.localizedDescription
				return
			}
		}
		
	}
	
	func signOut() {
		// Try to sign out
		try? auth.signOut()
		
		// mark user as signed out
		self.signedIn = false
	}
}
