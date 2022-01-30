//
//  AppViewModel.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-10.
//

import FirebaseAuth
import Foundation
import SwiftUI

final class AuthViewModel: ObservableObject {
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

	// MARK: Vars and Funcs for account deletion

	@Published var reAuthMessage: String?
	@Published var reAuthed = false
	func reAuthenticate(userEmail: String, userProvidedPassword: String) {
		let user = Auth.auth().currentUser

		let credential = EmailAuthProvider.credential(withEmail: userEmail, password: userProvidedPassword)

		user?.reauthenticate(with: credential) { (result, error)  in
			if let error = error {
				self.reAuthMessage = error.localizedDescription
				self.reAuthed = false
			} else {
				self.reAuthed = true
			}
		}
	}
	
	@Published var deleteMessage: String?
	func deleteAccount(linkListViewModel: LinkListViewModel, folderListViewModel: FolderListViewModel) {
		let user = Auth.auth().currentUser
		
		let folderRepos = FolderRepository()
		let linkRepos = LinkRepository()
		
		let filteredFolders = folderListViewModel.folderViewModels.filter { folderViewModel in
			folderViewModel.folder.userId == user?.uid
		}

		let filteredLinks = linkListViewModel.linkViewModels.filter { linkViewModel in
			linkViewModel.link.userId == user?.uid
		}
		
		for folderViewModel in filteredFolders {
			folderRepos.remove(folderViewModel.folder)
		}
		
		for linkViewModel in filteredLinks {
			linkRepos.remove(linkViewModel.link)
		}

		user?.delete { error in
			if let error = error {
				self.deleteMessage = error.localizedDescription
			} else {
				self.deleteMessage = "Account Deleted"
				self.signedIn = false
			}
		}
	}
}
