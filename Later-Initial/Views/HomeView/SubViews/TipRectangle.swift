//
//  TipRectangle.swift
//  Later
//
//  Created by Peter Salmon on 2022-02-01.
//

import SwiftUI

struct TipRectangle: View {
	@State private var randomInt = Int.random(in: 0 ..< AppInfo.tips.count)
	@State private var opacity = 1.0

	func updateProgressValue() {
		Task {
			while true {
				try await Task.sleep(nanoseconds: 350_000_000) // 0.35 seconds

				opacity -= 0.02
				if opacity <= 0.0 {
					opacity = 1.0
					let previousInt = randomInt
					repeat {
						randomInt = Int.random(in: 0 ..< AppInfo.tips.count)
					} while previousInt == randomInt
				}
			}
		}
	}

	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 5)
				.foregroundColor(Color("Tip Rectangle"))
				.frame(width: 300, height: 100)
			Text(AppInfo.tips[randomInt])
				.frame(width: 280, height: 80)
			VStack {
				HStack {
					Spacer()
					VStack {
						Spacer()
						Image(systemName: Icons().arrow)
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width: 20, height: 20)
							.opacity(opacity)
							.animation(.linear(duration: Constants().animationDuration), value: opacity)
							.padding(3)
					}
				}
			}
		}
		.frame(width: 300, height: 100)
		.animation(.easeInOut, value: randomInt)
		.onTapGesture {
			opacity = 1.0
			let previousInt = randomInt
			repeat {
				randomInt = Int.random(in: 0 ..< AppInfo.tips.count)
			} while previousInt == randomInt
		}
		.onAppear { updateProgressValue() }
	}
}
