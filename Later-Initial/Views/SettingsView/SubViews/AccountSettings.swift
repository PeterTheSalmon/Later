//
//  AccountSettings.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-10.
//

import SwiftUI

struct AccountSettings: View {
	@AppStorage("logInPageActive") var logInPageActive = true

	@EnvironmentObject var authViewModel: AuthViewModel

	var body: some View {
		Form {
			Section("Account Settings") {
				
				Divider()
				
				if authViewModel.signedIn {
				Button("Sign Out") {
					authViewModel.signOut()
					logInPageActive = true
				}
				} else {
					Text("You'll have better luck managing your account once you are signed in!")
				}
			}
		}
	}
}

struct AccountSettings_Previews: PreviewProvider {
	static var previews: some View {
		AccountSettings()
	}
}
