//
//  LogInPage.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-10.
//

import SwiftUI

struct LogInPage: View {
	@State private var email = ""
	@State private var password = ""
	@EnvironmentObject var authViewModel: AuthViewModel

	/// This is necessary to ensure that the user is always greeted with the home page
	@AppStorage("homeViewSelected") var homeViewSelected = true

	/// Used to activate the SignUpPage
	@AppStorage("signUpPageActive") var signUpPageActive = false

	// record if the user has tried to enter with an empty email or password
	@State private var badLogIn = false

	// Choose whether to show to forgot password options
	@State private var forgotPassword = false
	@State private var forgotPassEmail = ""
	@State private var forgotPassEmailSent = false
	@State private var emailDelayPassed = false

	func emailSendDelay() {
		Task {
			try await Task.sleep(nanoseconds: 1_000_000_000)
			withAnimation(.linear) { emailDelayPassed = true }
		}
	}

	func logIn() {
		guard !email.isEmpty, !password.isEmpty else {
			withAnimation(.linear) { badLogIn = true }
			authViewModel.errorDescription = "Email and Password cannot be empty."
			return
		}
		// Otherwise, log in
		authViewModel.signIn(email: email, password: password)
		homeViewSelected = true
	}

	var body: some View {
		VStack {
			Text("Log in to Later")
				.font(.largeTitle)

			HStack {
				Text("No account?")
				Button("Sign Up Instead") { withAnimation(.easeIn) { signUpPageActive = true } }.buttonStyle(.borderless)
			}
			VStack {
				HStack {
					Image(systemName: badLogIn ? "xmark" : "envelope")
						.frame(width: 18)

					TextField("", text: $email, prompt: Text("email"))
						.disableAutocorrection(true)
				}.underlineTextField(colour: badLogIn ? .red : .primary)

				HStack {
					Image(systemName: badLogIn ? "xmark" : "key")
						.frame(width: 18)
					SecureField("", text: $password, prompt: Text("password"))
				}.underlineTextField(colour: badLogIn ? .red : .primary)
			}
			.padding()
			.frame(maxWidth: 300)
			.textFieldStyle(.plain)

			HStack {
				if let error = authViewModel.errorDescription {
					Text("\(error)")
						.animation(.linear)
						.foregroundColor(.red)
						.onAppear { badLogIn = true }
				} else { EmptyView() }
			}.frame(width: 300, height: 50)

			// Login Button
			Button {
				logIn()
			} label: {
				Text("Log In")
			}
			.buttonStyle(SaveButton(colour: .accentColor))

			// Forgot password logic
			// TODO: Separate this into a separate view
			// Note: do not forget the onChange from below
			VStack {
				HStack {
					Button("Forgot your password?") { withAnimation(.linear) { forgotPassword = true } }.buttonStyle(.borderless)
					if forgotPassword {
						HStack {
							Image(systemName: "envelope")
								.frame(width: 18)

							TextField("", text: $forgotPassEmail, prompt: Text("email"))
								.textFieldStyle(.plain)
								.disableAutocorrection(true)
								.onSubmit {
									authViewModel.resetPassword(email: forgotPassEmail)
								}
							Button("􀈟") {
								authViewModel.resetPassword(email: forgotPassEmail)
								emailSendDelay()
							}
						}
						.frame(maxWidth: 300)
						.underlineTextField(colour: .primary)
					}
				}
				if emailDelayPassed {
					Text(authViewModel.resetPassDescription ?? "Sent! Check your email.")
						.foregroundColor(authViewModel.resetPassDescription == nil ? .green : .red)
				}
			}
		}
		.padding()
		.onChange(of: email) { _ in
			withAnimation(.linear) {
				badLogIn = false
			}
		}
		.onChange(of: password) { _ in
			withAnimation(.linear) {
				badLogIn = false
			}
		}
	}
}

struct LogInPage_Previews: PreviewProvider {
	static var previews: some View {
		LogInPage()
	}
}

extension Color {
	static let darkPink = Color(red: 208 / 255, green: 45 / 255, blue: 208 / 255)
}

extension View {
	func underlineTextField(colour: Color) -> some View {
		padding(.vertical, 10)
			.overlay(Rectangle().fill(Color.secondary).frame(height: 2).padding(.top, 35))
			.foregroundColor(colour)
	}
}
