// Contains the settings used throughout the app. They are gathered here for convenience.

import Foundation
import SwiftUI

struct AppSettings {
	// If true, folders are deleted in one click
	@AppStorage("instantDeleteFolder") var instantDeleteFolder = false

	// If true, link items are deleted in one click
	@AppStorage("instantDeleteLink") var instantDeleteLink = false
	
	// Number of notes created. Increased upon creating a new note
	@AppStorage("notesCreated") var notesCreated = 0
	
	// Number of folders created. Increased upon creating a new folders
	@AppStorage("folderCreated") var foldersCreated = 0
}
