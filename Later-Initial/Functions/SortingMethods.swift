//
//  SortingMethods.swift
//  Later
//
//  Created by Peter Salmon on 2021-12-26.
//

import Foundation
import SwiftUI

func SortList(linkListViewModel: LinkListViewModel) {
	@AppStorage("selectedSortStyle") var selectedStyle = 0
	@AppStorage("updateFavicon") var updateFavicon = false
	
	switch selectedStyle {
	case 0:
		linkListViewModel.linkViewModels.sort(by: { $0.link.title.uppercased() < $1.link.title.uppercased() })
	case 1:
		linkListViewModel.linkViewModels.sort(by: { $0.link.dateCreated < $1.link.dateCreated })
	case 2:
		linkListViewModel.linkViewModels.sort(by: { $0.link.url < $1.link.url })
	default:
		fatalError("Invalid Sort Style")
	}
	
	updateFavicon.toggle()
}
