//
//  AppInfo.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

import Foundation

struct AppInfo {
	static let name = "Later"
	static let version = "v0.4.0-beta"
	static var latestVersion: String? = nil
	static let creator = "Peter Salmon"
	static let description = "\(AppInfo.name) started as a solution to Reddit's atrocious post saving, and evolved into a larger-scoped link manager. I hope you enjoy!"
	static let tips = [
		"You can swipe notes to the left on your trackpad to delete them.",
		"Later follows your accent colour preference from system preferences!",
		"If you find a bug, let me know on GitHub!",
		"Suggestions? Let me know on Github!",
		"Later is completely private; nothing leaves your device.",
		"You can see your statistics on the about page.",
		"There are no bugs. I hope.",
		"Later receives periodic updates to add and improve functionality",
		"What's this? A tips box? Strange",
		"You can click the link or the website favicon to open a link"
	]
}
