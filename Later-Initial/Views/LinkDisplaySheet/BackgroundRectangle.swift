//
//  BackgroundRectangle.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-08.
//

import Foundation
import SwiftUI

struct BackgroundRectangle: View {
	
	var hoverStatus: Bool
	
	var body: some View {
		RoundedRectangle(cornerRadius: 10,
						 style: .circular)
			.frame(height: 50)
			.shadow(color: hoverStatus ? Color("Rectangle") : .gray, radius: 2)
			.animation(.linear(duration: 0.15), value: hoverStatus)
			.foregroundColor(Color("BG"))
	}
}
