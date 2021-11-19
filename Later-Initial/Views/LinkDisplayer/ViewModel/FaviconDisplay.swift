//
//  FaviconDisplay.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-13.
//

import SwiftUI
import CachedAsyncImage

struct FaviconDisplay: View {
	
	@State var test: Bool = false
	
	@Environment(\.openURL) var openURL
	var item: LinkItem
	@State var isHoveringIcon = false
	
    var body: some View {
		let faviconURL = URL(string: extractDomain(urlString: item.url))
		CachedAsyncImage(url: faviconURL, content: faviconStateManager)
    }
	
	@ViewBuilder
	func faviconStateManager(for phase: AsyncImagePhase) -> some View {
		switch phase {
		case .empty:
			ProgressView()
				.frame(width: 40, height: 40)
				.padding(.leading, 4)
				.padding(.trailing, 10)
				.onTapGesture {
					openLink(urlString: item.url)
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
				.animation(.linear(duration: 0.15), value: isHoveringIcon)
				.onTapGesture {
					openLink(urlString: item.url)
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
				Image(systemName: "questionmark.circle.fill")
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
					.animation(.linear(duration: 0.15), value: isHoveringIcon)
					.onTapGesture {
						openLink(urlString: item.url)
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
				openLink(urlString: item.url)
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
		FaviconDisplay(item: MockData.exampleItem, isHoveringIcon: true)
    }
}
