//
//  AuthenticationService.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-10.
//

import Foundation
import Firebase

/// AuthenticationService is an observable object that provides anonymous authentication for Firebase
///
/// ```user``` contains a User object when authentication happens
///
/// ```authenticationStateHandler``` manager changes in state, like log in/out
///
/// ```init()``` starts listeners upon class initiation
///
/// ```signIn()``` signs in anonymously if the user isn't signed in already. This value is stored locally, so only one sign-in is ever needed
///
/// ```if let handle = ``` checks if there’s already a handler instantiated and, if so, removes it
///
/// ```authenticationStateHandler``` assigns ```addStateDidChangeListener()``` to ```authenticationStateHandler()```
class AuthenticationService: ObservableObject {
	@Published var user: User?
	private var authenticationStateHandler: AuthStateDidChangeListenerHandle?
	
	init() {
		addListeners()
	}
	
	// 4
	static func signIn() {
		if Auth.auth().currentUser == nil {
			Auth.auth().signInAnonymously()
		}
	}
	
	private func addListeners() {
		// 5
		if let handle = authenticationStateHandler {
			Auth.auth().removeStateDidChangeListener(handle)
		}
		
		// 6
		authenticationStateHandler = Auth.auth()
			.addStateDidChangeListener { _, user in
				self.user = user
			}
	}
}
