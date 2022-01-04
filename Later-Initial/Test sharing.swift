//
//  Test sharing.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-02.
//

import SwiftUI
import Foundation

struct TestSharingService: View {
	@State private var showPicker = false
	var body: some View {
		Button("Share") {
			self.showPicker = true
		}
		.background(SharingsPicker(isPresented: $showPicker, sharingItems: ["Message"]))
	}
}

struct TestSharingService_Preview: PreviewProvider {
	static var previews: some View {
		TestSharingService()
	}
}
