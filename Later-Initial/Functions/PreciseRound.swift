//
//  PreciseRound.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-09.
//

import Foundation

// Specify the decimal place to round to using an enum
public enum RoundingPrecision {
	case ones
	case tenths
	case hundredths
}

// Round to the specific decimal place
public func preciseRound(
	_ value: Double,
	precision: RoundingPrecision = .ones) -> Double
{
	switch precision {
	case .ones:
		return round(value)
	case .tenths:
		return round(value * 10) / 10.0
	case .hundredths:
		return round(value * 100) / 100.0
	}
}
