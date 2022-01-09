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

/// Folder Model
struct FolderItem: Codable, Hashable, Identifiable {	
	@DocumentID var id: String?
	var name: String
	var colour: Color?
	var iconName: String?
	var dateCreated = Date.now
}
