//
//  FolderModel.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

import Foundation
import FirebaseFirestoreSwift

/// SwiftUI is used for the colour of the folder
import SwiftUI

/// Basis for all folders
///
/// TODO: add custom colours and icons
struct FolderItem: Codable, Hashable, Identifiable {	
	@DocumentID var id: String?
	var name: String
	var colour: Color?
	var iconName: String?
}
