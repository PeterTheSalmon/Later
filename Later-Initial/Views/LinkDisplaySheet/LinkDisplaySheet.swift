//
//  LinkDisplaySheet.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-10-30.
//

import SwiftUI

struct LinkDisplaySheet: View {
	var item: LinkItem
	
	@Environment(\.openURL) var openURL
	@ObservedObject var listItems: MockData
	
	@State private var isHoveringRectangle: Bool = false
	@State private var isHoveringIcon: Bool = false
	@State private var isHoveringText: Bool = false
	
	var itemIndex: Int? {
		listItems.ItemList.firstIndex(where: { $0.id == item.id }) ?? nil
	}
	
	var body: some View {
		ZStack {
			BackgroundRectangle(hoverStatus: isHoveringRectangle)
			
			HStack {
				TitleLink(subItem: item)
				
				Spacer()
				
				DeleteButton(listItems: listItems,
				             hoveringReference: isHoveringRectangle,
				             item: item)
					.onTapGesture {
						if itemIndex != nil {
							listItems.ItemList.remove(at: itemIndex!)
						}
					}
				
				FavouriteButton(listItems: listItems,
				                hoveringReference: isHoveringRectangle,
				                item: item,
				                itemIsFavourite: item.isFavourite)
					.onTapGesture {
						if itemIndex != nil {
							listItems.ItemList[itemIndex!].isFavourite.toggle()
						}
					}
				 
				Divider()
					.frame(height: 40)

				/// this was originally compacted into one line, but that caused inconsistent loading when the link was first entered
				/// splitting this into two lines seems to fix the issue
				let faviconURL = URL(string: extractDomain(urlString: item.url))
				AsyncImage(url: faviconURL, content: faviconStateManager)
			}
		}
		.frame(height: 50)
		.padding(1)
		.padding(.leading, 1.5)
		.padding(.trailing, 1.5)
		.onHover { hoveringRectangle in
			isHoveringRectangle = hoveringRectangle
		}
	}
	
	//
	//	this marks the end of the actual content - below is just functions
	//
	
	func openLink(urlString: String) {
		guard let url = URL(string: urlString) else {
			return
		}
		openURL(url)
	}
	
	@ViewBuilder
	private func faviconStateManager(for phase: AsyncImagePhase) -> some View {
		switch phase {
		case .empty:
			ProgressView()
				.frame(width: 40, height: 40)
				.padding(.leading, 4)
				.padding(.trailing, 10)
				.onTapGesture {
					openLink(urlString: item.url)
				}
			
		case .success(let image):
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
}

struct LinkDisplaySheet_Previews: PreviewProvider {
	static var previews: some View {
		LinkDisplaySheet(item: MockData.exampleItem, listItems: MockData())
	}
}
