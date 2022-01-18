//
//  VersionViewModel.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-18.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation
import SwiftUI

struct Version: Codable {
	var appVersion: String
}

final class VersionViewModel: ObservableObject {
	func getVersion() {
		/// set up the store
		let store = Firestore.firestore()

		/// path to the version file
		let docRef = store.collection("version").document("versionID")

		/// get the document
		docRef.getDocument { document, error in
			let result = Result {
				/// Encode it to the version struct
				try document?.data(as: Version.self)
			}

			switch result {
			case let .success(version):
				if let version = version {
					/// Mark the latest version in app info
					withAnimation(.linear(duration: Constants().animationDuration)) {
						AppInfo.latestVersion = version.appVersion
					}
				} else {
					print("Unable to fetch latest version")
				}
			case let .failure(error):
				print("Error while fetching latest app version: \(error)")
			}
		}
	}
}
