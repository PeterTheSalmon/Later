//
//  NewFolderSheet.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

import SwiftUI


struct NewFolderSheet: View {
	@Environment(\.dismiss) var dismiss

	// Detect wether the user is in light or dark mode.
	// This is used to change the colour in the folder edit view to be something more pleasing to the eye
	@Environment(\.colorScheme) var colorScheme

	@State private var symbolName = 0
	var symbolNames = [
		"folder",
		"display",
		"music.note",
		"star",
		"link",
		"cloud.fill",
		"externaldrive",
		"wrench.and.screwdriver",
	]

	@State private var name = ""
	@ObservedObject var activeFolderList: FolderClass
	@State var isPressed = false
	@AppStorage("folderCreated") var foldersCreated = 0
	@State var newFolderColour = Color.primary
	@State private var folderColour = Color.primary
	@State private var finalFolderColour: Color?

	/// Add the folder to the list of all folders, and add 1 to the foldersCreated stat
	private func createFolder() {
		activeFolderList.folderList.append(FolderItem(name: name, colour: finalFolderColour, iconName: symbolNames[symbolName]))
		foldersCreated += 1
		dismiss()
	}

	var body: some View {
		VStack {
			Label("Add New Folder", systemImage: "folder.badge.plus")
				.font(.title)
			
			// Colour Picker
			HStack {
				ColorPicker("Folder Colour", selection: $folderColour, supportsOpacity: false)
				Button {
					finalFolderColour = nil
					if colorScheme == .dark {
						folderColour = .white
					} else {
						folderColour = .black
					}
				} label: {
					Image(systemName: "gobackward")
				}
				.buttonStyle(.borderless)
				.help("Reset")
			}
			.onChange(of: folderColour) { _ in
				finalFolderColour = folderColour
			}

			Form {
				TextField("", text: $name, prompt: Text("Name"))
					.font(.title3)
					.onSubmit {
						createFolder()
					}
			}
			.textFieldStyle(.roundedBorder)

			Picker("", selection: $symbolName) {
				ForEach(0 ..< symbolNames.count) {
					Image(systemName: self.symbolNames[$0])
				}
			}
			.pickerStyle(.segmented)


			HStack {
				Button { // save normally
					createFolder()
				} label: {
					Label("Save", systemImage: "tray.and.arrow.down")
				}
				.buttonStyle(SaveButton(colour: Color.accentColor))
				.keyboardShortcut(.defaultAction)
			}
			.padding(.top, 6)
		}
		.padding()
		.frame(width: 350)
		.onExitCommand { dismiss() }
	}
}

struct NewFolderSheet_Previews: PreviewProvider {
	static var previews: some View {
		NewFolderSheet(activeFolderList: FolderClass())
	}
}
