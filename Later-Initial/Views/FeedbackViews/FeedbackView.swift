//
//  FeedbackView.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-31.
//

import SwiftUI

struct FeedbackView: View {
	@State private var subject = ""
	@State private var email = ""
	@State private var message = ""
	@State private var feedbackSent = false

	@ObservedObject var feedbackViewModel = FeedbackViewModel()

	var body: some View {
		HStack {
			if feedbackSent {
				VStack {
					if let message = feedbackViewModel.resultMessage {
						Text(message).foregroundColor(.red)
						Button("Go back") { feedbackSent.toggle() }
					} else {
						Label("Feedback Sent!", systemImage: "checkmark.circle")
							.font(.largeTitle)
							.foregroundColor(.green)
							.padding()
						Button("Send more?") {
							subject = ""
							message = ""
							withAnimation(.default) {
								feedbackSent.toggle()
							}
						}
					}
				}
			} else {
				VStack(alignment: .leading, spacing: 10) {
					Text("Feedback")
						.font(.title)
						.fontWeight(.semibold)
						.foregroundColor(.accentColor)
					Text("Ideas to improve Later? Bugs? Feature requests? Send me some feedback and I'll get back to you!")
					Divider()

					Form {
						TextField("Subject", text: $subject)
						TextField("Email", text: $email, prompt: Text("Optional"))
					}

					Divider()
					Text("Message")
					TextEditor(text: $message)
						.frame(maxHeight: 100)
						.border(Color.gray)

					HStack {
						Spacer()
						Button("Submit") {
							feedbackViewModel.sendFeedback(feedback: Feedback(title: subject, email: email, message: message))

							withAnimation(.default) { feedbackSent.toggle() }
						}
						.buttonStyle(.borderedProminent)
						Spacer()
					}
				}
				.padding()

				Image("Feedback")
					.resizable()
					.scaledToFit()
					.frame(width: 300, height: 300)
					.padding()
			}
		}
		.frame(minWidth: 650, minHeight: 350)
		.toolbar { GenericToolbar() }
		.navigationTitle("Feedback")
	}
}
