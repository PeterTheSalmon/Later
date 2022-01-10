//
//  FaviconDisplay.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-13.
//

import CachedAsyncImage
import SwiftUI

struct FaviconDisplay: View {
	@State var test: Bool = false
	@Environment(\.openURL) var openURL
	var linkViewModel: LinkViewModel
	@State var isHoveringIcon = false
	@AppStorage("updateFavicon") var updateFavicon = false

	var body: some View {
		let faviconURL = URL(string: ExtractDomain(urlString: linkViewModel.link.url))
		VStack {
			if updateFavicon { CachedAsyncImage(url: faviconURL, content: faviconStateManager)
			} else { CachedAsyncImage(url: faviconURL, content: faviconStateManager) }
		}
		.animation(.linear(duration: Constants().animationDuration), value: updateFavicon)
	}

	@ViewBuilder
	func faviconStateManager(for phase: AsyncImagePhase) -> some View {
		switch phase {
		case .empty:
			Image(systemName: Icons().link)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.foregroundColor(.gray)
				.frame(width: 40, height: 40)
				.padding(.leading, 4)
				.padding(.trailing, 10)
				.shadow(color: .gray, radius: isHoveringIcon ? 2 : 0)
				.onHover { hoveringIcon in
					isHoveringIcon = hoveringIcon
				}
				.animation(.linear(duration: Constants().animationDuration), value: isHoveringIcon)
				.onTapGesture {
					openLink(urlString: linkViewModel.link.url)
				}
				.onHover { inside in
					if inside {
						NSCursor.pointingHand.push()
					} else {
						NSCursor.pop()
					}
				}

		case let .success(image):
			image
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 40, height: 40)
				.padding(.leading, 4)
				.padding(.trailing, 10)
				.shadow(color: .gray, radius: isHoveringIcon ? 2 : 0)
				.onHover { hoveringIcon in
					isHoveringIcon = hoveringIcon
				}
				.animation(.linear(duration: Constants().animationDuration), value: isHoveringIcon)
				.onTapGesture {
					openLink(urlString: linkViewModel.link.url)
				}
				.onHover { inside in
					if inside {
						NSCursor.pointingHand.push()
					} else {
						NSCursor.pop()
					}
				}

		case .failure:
			VStack {
				Image(systemName: Icons().link)
					.resizable()
					.aspectRatio(contentMode: .fill)
					.foregroundColor(.gray)
					.frame(width: 40, height: 40)
					.padding(.leading, 4)
					.padding(.trailing, 10)
					.help("No Favicon Found")
					.shadow(color: .gray, radius: isHoveringIcon ? 2 : 0)
					.onHover { hoveringIcon in
						isHoveringIcon = hoveringIcon
					}
					.animation(.linear(duration: Constants().animationDuration), value: isHoveringIcon)
					.onTapGesture {
						openLink(urlString: linkViewModel.link.url)
					}
					.onHover { inside in
						if inside {
							NSCursor.pointingHand.push()
						} else {
							NSCursor.pop()
						}
					}
			}
			.onTapGesture {
				openLink(urlString: linkViewModel.link.url)
			}
		@unknown default:
			Text("Unknown")
				.foregroundColor(.gray)
		}
	}

	func openLink(urlString: String) {
		guard let url = URL(string: urlString) else {
			return
		}
		openURL(url)
	}
}

struct FaviconDisplay_Previews: PreviewProvider {
	static var previews: some View {
		Text("fix")
		//FaviconDisplay(linkViewModel: LinkViewModel(link: LinkItem(title: "google testing", url: "google.ca")))
	}
}
