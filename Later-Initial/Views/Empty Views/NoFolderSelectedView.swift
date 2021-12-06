//
//  NoFolderSelectedView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

import SwiftUI

struct NoFolderSelectedView: View {
	@Environment(\.isSearching) var isSearching
	@Binding var query: String
	@ObservedObject var listItems: MockData
	@Binding var isShowingSheet: Bool
	@ObservedObject var activeFolderList: FolderClass
	@Binding var isShowingNewFolderSheet: Bool
	@State private var randomInt = Int.random(in: 0 ... 4)
	@State private var opacity = 1.0

	func updateProgressValue() {
		Task {
			while true {
				await Task.sleep(1 * 100_000_000) // one second
				opacity -= 0.02
				if opacity <= 0.0 {
					opacity = 1.0
					let previousInt = randomInt
					repeat {
						randomInt = Int.random(in: 0 ... 4)
					} while previousInt == randomInt
				}
			}
		}
	}

	var body: some View {
		if isSearching && !query.isEmpty {
			SearchView(query: $query,
			           listItems: listItems,
			           isShowingNewItemSheet: $isShowingSheet,
			           activeFolderList: activeFolderList,
			           isShowingNewFolderSheet: $isShowingNewFolderSheet)
		} else {
			VStack {
				Spacer()

				Text("Welcome Back!")
					.font(.largeTitle)
					.fontWeight(.bold)
					.padding()

				Text("Select a folder, or presss ⌘-⇧-n create a new one")

				Spacer()

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
								Image(systemName: "arrow.forward.circle")
									.resizable()
									.aspectRatio(contentMode: .fit)
									.frame(width: 20, height: 20)
									.opacity(opacity)
									.animation(.linear(duration: 0.1), value: opacity)
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
						randomInt = Int.random(in: 0 ... 4)
					} while previousInt == randomInt
				}

				Spacer()
			}
			.onAppear {
				updateProgressValue()
			}
			.padding()
		}
	}
}

struct NoFolderSelectedView_Previews: PreviewProvider {
	static var previews: some View {
		NoFolderSelectedView(query: .constant("test"), listItems: MockData(), isShowingSheet: .constant(false), activeFolderList: FolderClass(), isShowingNewFolderSheet: .constant(false))
	}
}
