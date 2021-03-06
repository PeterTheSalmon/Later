//
//  LoggedOutView.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-10.
//

import SwiftUI

struct LoggedOutView: View {
	@AppStorage("logInPageActive") var logInPageActive = true
	@AppStorage("signUpPageActive") var signUpPageActive = false
	@AppStorage("passwordResetPageActive") var passwordResetPageActive = false
	
	@State private var whyTextPresented = false

	var body: some View {
		VStack(alignment: .center) {
			Text("Welcome to")
				.font(.title2)
				.fontWeight(.semibold)
			Text("Later")
				.font(.custom("Helvetica", size: 50, relativeTo: .largeTitle).weight(.black))
				.fontWeight(.black)
				.foregroundColor(.accentColor)
			Text("\(AppInfo.version)")
			Text("Get started by signing in or creating an account →")
				.multilineTextAlignment(.center)
				.padding()

			Button("Why do I need an account?") { withAnimation { whyTextPresented.toggle() } }.buttonStyle(.borderless)
			
			if whyTextPresented {
				Text("Later uses accounts to ensure that your data is saved and secured in the cloud. You can access your data on any macOS device.").padding()
			}

			Group {
				NavigationLink(destination: LogInPage(), isActive: $logInPageActive) {}.hidden()
				NavigationLink(destination: SignUpPage(), isActive: $signUpPageActive) {}.hidden()
			}
		}
		.frame(width: 240)
	}
}

struct LoggedOutView_Previews: PreviewProvider {
	static var previews: some View {
		LoggedOutView()
	}
}
