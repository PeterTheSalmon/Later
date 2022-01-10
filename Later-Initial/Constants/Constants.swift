//
//  Constants.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-09.
//

import Foundation
import SwiftUI

struct Constants {
	
	@AppStorage("animationDuration") var animationDuration = 0.1

	var animationTime: Double { return animationDuration }
	
}
