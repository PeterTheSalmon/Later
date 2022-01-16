//
//  SignUpPage.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-10.
//

import Foundation
import SwiftUI

struct SignUpPage: View {
	@State private var email = ""
	@State private var confirmEmail = ""

	@State private var password = ""
	@State private var confirmPassword = ""

	@EnvironmentObject var authViewModel: AuthViewModel

	/// This is necessary to ensure that the user is always greeted with the home page
	@AppStorage("homeViewSelected") var homeViewSelected = true
	/// Used to activate the LogInPage
	@AppStorage("logInPageActive") var logInPageActive = true

	/// this is used to ensure that, if it is a new user, they must create a folder immediately upon creating an account
	@AppStorage("FolderListEmpty") var folderListIsEmpty = false

	@State private var badSignUp = false

	func signUp() {
		guard !email.isEmpty, !password.isEmpty else {
			withAnimation(.linear) { badSignUp = true }
			authViewModel.errorDescription = "Email and Password cannot be empty."
			return
		}
		guard email == confirmEmail && password == confirmPassword else {
			withAnimation(.linear) { badSignUp = true }
			authViewModel.errorDescription = "Email or Password do not match"
			return
		}
		// Otherwise, log in
		authViewModel.signUp(email: email, password: password)

	}
	
	var body: some View {
		VStack {
			Text("Sign Up")
				.font(.largeTitle)

			HStack {
				Text("Already have an account?")
				Button("Log In Instead") { withAnimation(.easeIn) { logInPageActive = true } }.buttonStyle(.borderless)
			}

			Form {
				HStack {
					HStack {
						Image(systemName: badSignUp ? "xmark" : "envelope")
							.frame(width: 18)

						TextField("", text: $email, prompt: Text("email"))
							.disableAutocorrection(true)
					}.underlineTextField(colour: badSignUp ? .red : .primary)

					HStack {
						Image(systemName: badSignUp ? "xmark" : "envelope")
							.frame(width: 18)

						TextField("", text: $confirmEmail, prompt: Text("confirm email"))
							.disableAutocorrection(true)
					}.underlineTextField(colour: badSignUp ? .red : .primary)
				}

				HStack {
					HStack {
						Image(systemName: badSignUp ? "xmark" : "key")
							.frame(width: 18)
						SecureField("", text: $password, prompt: Text("password"))
					}.underlineTextField(colour: badSignUp ? .red : .primary)

					HStack {
						Image(systemName: badSignUp ? "xmark" : "key")
							.frame(width: 18)
						SecureField("", text: $confirmPassword, prompt: Text("confirm password"))
					}.underlineTextField(colour: badSignUp ? .red : .primary)
				}
			}
			.padding()
			.frame(maxWidth: 600)
			.textFieldStyle(.plain)

			HStack {
				if let error = authViewModel.errorDescription {
					Text("\(error)")
						.animation(.linear)
						.foregroundColor(.red)
						.onAppear { badSignUp = true }
				} else { EmptyView() }
			}.frame(width: 300, height: 50)

			Button {
				signUp()
			} label: {
				Text("Sign Up")
			}
			.buttonStyle(SaveButton(colour: .accentColor))
		}
		.padding()
		.onChange(of: email) { _ in
			withAnimation(.linear) {
				badSignUp = false
			}
		}
		.onChange(of: password) { _ in
			withAnimation(.linear) {
				badSignUp = false
			}
		}
		.onChange(of: confirmEmail) { _ in
			withAnimation(.linear) {
				badSignUp = false
			}
		}
		.onChange(of: confirmPassword) { _ in
			withAnimation(.linear) {
				badSignUp = false
			}
		}
	}
}
