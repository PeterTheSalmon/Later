//
//  GameView.swift
//  Later
//
//  Created by Peter Salmon on 2022-02-02.
//

import SwiftUI

/// An easter egg game. Far from good, but fun to play once and offers a nice quote at the end. Thanks everyone!
struct GameView: View {
	@State private var x = 250
	@State private var y = 235

	let possibleY = [25, 50, 75, 100, 125, 150, 175, 200]

	@State private var currentIndex = Int.random(in: 0 ... 7)

	@State private var score = 0

	func moveDown10() {
		withAnimation(.linear) {
			y += 2
		}
	}

	func moveDownSmall() {
		withAnimation(.linear) {
			y += (y - 235) / 5
		}
	}

	func lowerY() {
		Task {
			while true {
				if y <= 225 {
					moveDown10()
				} else if y > 225, y < 235 {
					moveDownSmall()
				}
				try await Task.sleep(nanoseconds: 20_000_000)
			}
		}
	}

	var body: some View {
		if score >= 10 {
			ZStack {
				Color.gray
				LinearGradient(colors: [Color("Gradient 1"), Color("Gradient 2")], startPoint: .top, endPoint: .bottom)
					.opacity(0.75)
				VStack {
					Spacer()
					Text("Thanks for playing!").font(.largeTitle)
					Button("Play Again") { score = 0 }.buttonStyle(.borderless)
					Spacer()
					Text("Thank you for using Later! I hope you enjoy this passion project of mine.")
						.padding()

					Divider()

					Text("\"Twenty years from now you will be more disappointed by the things you didn’t do than by the ones you did do. So throw off the bowlines. Sail away from the safe harbour. Catch the trade winds in your sails. Explore. Dream. Discover.\"")
					Spacer()
				}
				.padding()
			}
			.frame(width: 500, height: 300)

		} else {
			ZStack {
				Rectangle()
					.fill(LinearGradient(colors: [Color("Gradient 1"), Color("Gradient 2")], startPoint: .topLeading, endPoint: .bottomTrailing))
				VStack {
					VStack {
						Image(systemName: "person.fill")
							.resizable()
							.frame(width: 20, height: 20)
							.position(x: CGFloat(x), y: CGFloat(y))
					}
					.frame(height: 240)
					ZStack {
						Rectangle().fill(Color.secondary)
						HStack {
							VStack {
								HStack {
									Text("Collect the links!")
										.font(.largeTitle)
										.fontWeight(.bold)
										.foregroundColor(.gray)

									Text("Score: \(score)")
										.font(.largeTitle)
										.fontWeight(.black)
								}
								Text("Press space to jump, enter to pick up the link")
									.foregroundColor(.gray)
							}

							/// Buttons
							Group {
								Button("Jump") {
									withAnimation(.linear) {
										if y > 50 {
											y -= 50
										} else if y < 50, y > 0 {
											y -= y / 2
										}
									}
								}
								.animation(.linear, value: y)
								.keyboardShortcut(KeyEquivalent.space, modifiers: [])
								.frame(width: 0, height: 0)
								.hidden()

								Button("Capture") {
									if y <= possibleY[currentIndex] + 15, y >= possibleY[currentIndex] - 15 {
										score += 1

										let previousIndex = possibleY[currentIndex]
										repeat {
											currentIndex = Int.random(in: 0 ... 7)
										} while currentIndex == previousIndex
									}
								}
								.animation(.linear, value: y)
								.keyboardShortcut(.defaultAction)
								.frame(width: 0, height: 0)
								.hidden()
							}
						}
					}
				}
				VStack {
					Image(systemName: "link")
						.resizable()
						.frame(width: 20, height: 20)
						.position(x: 250, y: CGFloat(possibleY[currentIndex]))
				}
			}
			.onAppear(perform: lowerY)
			.frame(width: 500, height: 300)
		}
	}
}

struct GameView_Previews: PreviewProvider {
	static var previews: some View {
		GameView()
	}
}
