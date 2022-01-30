//
//  DeleteAccountView.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-29.
//

import SwiftUI

struct DeleteAccountView: View {
	@EnvironmentObject var authViewModel: AuthViewModel
	@EnvironmentObject var linkListViewModel: LinkListViewModel
	@EnvironmentObject var folderListViewModel: FolderListViewModel

	@State private var hasReAuthenticated = false
	@State private var userEmail = ""
	@State private var userPassword = ""
	@State private var deleteAlertPresented = false
	@State private var accountHasBeenDeleted = false

	@Environment(\.dismiss) var dismiss

	var body: some View {
		VStack {
			if accountHasBeenDeleted {
				Text("Thank you for using Later! You can now close this window")
			} else {
				if !hasReAuthenticated {
					Form {
						Text("Confirm your identity before deleting your account")

						if let errorMessage = authViewModel.reAuthMessage {
							Text(errorMessage).foregroundColor(.red)
						}
						Group {
							TextField("Email", text: $userEmail)
							SecureField("Password", text: $userPassword)
						}.frame(width: 400)
						Button("Continue") {
							authViewModel.reAuthenticate(userEmail: userEmail, userProvidedPassword: userPassword)
							Task {
								try await Task.sleep(nanoseconds: 1_000_000_000)
								if authViewModel.reAuthed { hasReAuthenticated = true }
							}
						}
					}
				} else if hasReAuthenticated {
					Text("Are you sure you want to delete your account?").font(.title)
					Text("This action cannot be undone. All data associated with your account will be deleted.")
					Button("Confirm") { deleteAlertPresented = true }
				}
			}
		}
		.alert(isPresented: $deleteAlertPresented) {
			Alert(title: Text("Press confirm to delete your account"),
			      message: Text("Thank you for using Later!"),
			      primaryButton: Alert.Button.destructive(Text("Confirm"), action: {
			      	authViewModel.deleteAccount(linkListViewModel: linkListViewModel, folderListViewModel: folderListViewModel)
			      	dismiss()
			      	accountHasBeenDeleted = true
			      }),
			      secondaryButton: Alert.Button.cancel(Text("Cancel")))
		}
		.padding()
		.frame(width: 600, height: 250)
	}
}
