//
//  AddHTTPS.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-05.
//

import Foundation

func checkURLconventions(urlString: String) -> String {
	
	
	if urlString.starts(with: "https") {
		return urlString
	
	} else if urlString.starts(with: "www") {
		return "https://" + urlString
	
	} else {
		return "https://www." + urlString
	}

}


