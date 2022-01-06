import Foundation
import SwiftUI

/// Contains the settings used throughout the app. They are gathered here for convenience.
struct AppSettings {
	// If true, folders are deleted in one click
	@AppStorage("instantDeleteFolder") var instantDeleteFolder = false

	// If true, link items are deleted in one click
	@AppStorage("instantDeleteLink") var instantDeleteLink = false
	
	// Number of notes created. Increased upon creating a new note
	@AppStorage("notesCreated") var notesCreated = 0
	
	// Number of folders created. Increased upon creating a new folders
	@AppStorage("folderCreated") var foldersCreated = 0
	
	// Number of times the app has been opened, incremented when the main window is opened
	// This technically means that the app doesn't have to be quit to increase this value
	// May be worth it to change this so that it only increments if the app was quit
	@AppStorage("timesOpened") var timesOpened = 0
	
	// True upon installing the app.
	// While true, the user is presented with a modal explaining basic functions
	// Set to false when the modal is dismissed
	@AppStorage("introSeen") var newUser = true
	
	// When changing the link displayer view in any way, favicons stop displaying
	@AppStorage("updateFavicon") var updateFavicon = false
	
	@AppStorage("selectedSortStyle") private var selectedStyle = 0
}