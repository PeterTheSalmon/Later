//
//  AboutView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-10.
//

/// this is just here for info and advertising, basically :)

import SwiftUI

struct AboutView: View {
	@Binding var timesOpened: Int
	@ObservedObject var activeFolderList: FolderClass
	@Binding var isShowingNewFolderSheet: Bool
	@Binding var isShowingSheet: Bool
	@ObservedObject var listItems: MockData
	@Environment(\.openURL) var openURL
	
	var tipList: [String]
	
	var body: some View {
		VStack(alignment: .leading) {
			Text("About Later")
				.font(.title)
				.fontWeight(.semibold)
				.foregroundColor(.accentColor)
				.padding(.horizontal)
			
			Text("""
			Created by \(AppInfo.creator)
			\(AppInfo.version)
			""")
			.padding()
			
			// Description
			Text(AppInfo.description)
				.padding(.horizontal)
				.padding(.bottom)
				.frame(minWidth: 300, maxWidth: 400, alignment: .leading)
			
			HStack {
				Button { openURL(URL(string: "https://discord.gg/vCBAkhAgFn")!) } label: {
					HStack {
						Image("Discord")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width: 30, height: 30)
						Text("Discord")
							.font(.title2)
					}
					.frame(maxWidth: .infinity, maxHeight: .infinity)
				}
				.buttonStyle(SocialButtonStyle(gradient: [Color("Discord 1"), Color("Discord 2")]))
				.onHover { inside in
					if inside {
						NSCursor.pointingHand.push()
					} else {
						NSCursor.pop()
					}
				}
				
				Button { openURL(URL(string: "https://github.com/PeterTheSalmon/Later")!) } label: {
					HStack {
						Image("GitHub")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width: 30, height: 30)
						Text("GitHub")
							.font(.title2)
					}
					.frame(maxWidth: .infinity, maxHeight: .infinity)
				}
				.buttonStyle(SocialButtonStyle(gradient: [Color("GitHub 1"), Color("GitHub 2")]))
				.onHover { inside in
					if inside {
						NSCursor.pointingHand.push()
					} else {
						NSCursor.pop()
					}
				}
				
			}
			.padding()
			
			Text("**Fun Fact:** you've opened Later \(timesOpened) times.")
				.padding(.horizontal)
				.help("This was made simply to test @AppStorage")
			
			Button("Open Source Licenses") {
				OpenSourceLicenses().openInWindow(title: "Open Source Licenses", sender: self)
			}
			.padding()
		}
		.sheet(isPresented: $isShowingNewFolderSheet) {
			NewFolderSheet(activeFolderList: activeFolderList)
		}
		.sheet(isPresented: $isShowingSheet) {
			NewItemSheet(listItems: listItems, activeFolderList: activeFolderList, parentFolder: activeFolderList.folderList[0])
		}
		.toolbar {
			ToolbarItem(placement: .navigation) {
				Button {
					toggleSidebar()
				} label: {
					Image(systemName: "sidebar.left")
				}
			}
		}
		.navigationTitle("Later")
	}
		
	private func toggleSidebar() {
		NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
	}
}

struct AboutView_Previews: PreviewProvider {
	static var previews: some View {
		AboutView(timesOpened: .constant(4), activeFolderList: FolderClass(), isShowingNewFolderSheet: .constant(false), isShowingSheet: .constant(false), listItems: MockData(), tipList: AppInfo.tips)
	}
}

extension View {
	
	@discardableResult
	func openInWindow(title: String, sender: Any?) -> NSWindow {
		let controller = NSHostingController(rootView: self)
		let win = NSWindow(contentViewController: controller)
		win.contentViewController = controller
		win.title = title
		win.makeKeyAndOrderFront(sender)
		return win
	}
}
