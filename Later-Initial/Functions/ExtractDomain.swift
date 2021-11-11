//
//  ExtractDomain.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-02.
//

import Foundation
import SwiftUI

func extractDomain(urlString: String) -> String {
	let url = URL(string: urlString)
	
	if let domain = url?.host {
		let faviconLink = "https://" + domain + "/favicon.ico"
		return faviconLink
	}
	
	return "No Website Found :(" // a better return would be smart
}

