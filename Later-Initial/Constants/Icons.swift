//
//  IconNames.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-09.
//

import Foundation
import SwiftUI

struct Icons {
	
	@AppStorage("roundIcons") var roundIcons = false

	var info: String { return roundIcons ? "info.circle" : "info" }
	
	var folder: String { return roundIcons ? "folder.circle" : "folder" }
	
	var gear: String { return roundIcons ? "gear.circle" : "gear" }
	
	var home: String { return roundIcons ? "house.circle" : "house" }
	
	// No option to have a circular new folder icon
	var newFolder: String { return "folder.badge.plus" }
	
	var edit: String { return roundIcons ? "pencil.circle" : "pencil" }
	
	var share: String { return roundIcons ? "square.and.arrow.up.circle" : "square.and.arrow.up" }
	
	// link.circle isn't perfect but it probably the best option
	var copy: String  { return roundIcons ? "link.circle" : "doc.on.clipboard" }
	
	var delete: String { return roundIcons ? "trash.circle" : "trash" }
	
	// need for both non and yes favourited items
	var emptyStar: String { return roundIcons ? "star.circle" : "star" }
	var filledStar: String { return roundIcons ? "star.circle" : "star.fill" }
	
	var newItem: String { return roundIcons ? "plus.circle.fill" : "plus"}
	
	var arrow: String { return roundIcons ? "arrow.forward.circle" : "arrow.forward" }
	
	var link: String { return roundIcons ? "link.circle" : "link" }
	
	var symbolNames: [String] { return [
		"folder",
		"display",
		"music.note",
		"star",
		"link",
		"cloud",
		"externaldrive",
		"wrench.and.screwdriver",
	] }
}
