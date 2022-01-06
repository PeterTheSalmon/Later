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
	var sortStyles = ["Name", "Date", "Url"]
	@AppStorage("selectedSortStyle") private var selectedStyle = 0
	@ObservedObject var linkViewModel: LinkListViewModel

	var body: some View {
		VStack {
			Picker(selection: $selectedStyle, label: Text("Sort by:")) {
				ForEach(0 ..< sortStyles.count) {
					Text(self.sortStyles[$0])
				}
			}
		}
		.frame(maxWidth: 130)
		.pickerStyle(.menu)
		.onChange(of: selectedStyle) { _ in
			// TODO: SortList is declared in a separate file. It need to be updated to support Firebase
			// SortList(selectedStyle: selectedStyle, listItems: listItems)
		}
	}
}

struct Previews_SortStylePicker_Previews: PreviewProvider {
	static var previews: some View {
		SortStylePicker(linkViewModel: LinkListViewModel())
	}
}