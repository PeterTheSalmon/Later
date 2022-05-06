//
//  SortStylePicker.swift
//  Later
//
//  Created by Peter Salmon on 2021-12-14.
//

import SwiftUI

/// A picker that accesses the stored sorting preference value. Upon changing this value, the list is sorted according to user preferences
///
/// `The SortList()` function is stored in a separate file, SortingMethods.swift
struct SortStylePicker: View {
	var sortStyles = ["Name", "Date", "URL"]
	@AppStorage("selectedSortStyle") private var selectedStyle = 0
	@ObservedObject var linkListViewModel: LinkListViewModel

	var body: some View {
		VStack {
			Picker(selection: $selectedStyle, label: Text("Sort by:")) {
				ForEach(0 ..< sortStyles.count, id: \.self) {
					Text(self.sortStyles[$0])
				}
			}
		}
		.frame(maxWidth: 130)
		.pickerStyle(.menu)
		.onChange(of: selectedStyle) { _ in
			withAnimation(.linear(duration: Constants().animationTime)) {
				SortList(linkListViewModel: linkListViewModel)
			}
		}
	}
}

struct Previews_SortStylePicker_Previews: PreviewProvider {
	static var previews: some View {
		SortStylePicker(linkListViewModel: LinkListViewModel())
	}
}
