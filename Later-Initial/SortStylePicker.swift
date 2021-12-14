//
//  SortStylePicker.swift
//  Later
//
//  Created by Peter Salmon on 2021-12-14.
//

import SwiftUI

struct SortStylePicker: View {
	var sortStyles = ["Name", "Date", "Url"]
	@State private var selectedStyle = 0
	
	var body: some View {
		VStack {
			Picker(selection: $selectedStyle, label: Text("Sort by:")) {
				ForEach(0..<sortStyles.count) {
					Text(self.sortStyles[$0])
				}
			}
		}
		.frame(maxWidth: 130)
		.pickerStyle(.menu)
		.onAppear {
			print("appeared")
		}
		.onChange(of: selectedStyle) { testing in
			print(sortStyles[selectedStyle])
		}
	}
}

struct Previews_SortStylePicker_Previews: PreviewProvider {
	static var previews: some View {
		SortStylePicker()
	}
}
