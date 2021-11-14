//
//  TempTest.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-13.
//

import SwiftUI

struct TempTest: View {
	@State private var isOn = false
	@State private var disabled = true

	var body: some View {
		VStack {
			Toggle("Test", isOn: $isOn)
				.disabled(disabled)
		}
	}
}

struct TempTest_Previews: PreviewProvider {
	static var previews: some View {
		TempTest()
	}
}
