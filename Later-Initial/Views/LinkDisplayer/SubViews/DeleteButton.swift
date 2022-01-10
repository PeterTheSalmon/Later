//
//  LinkSheetIcons.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-08.
//

import SwiftUI

struct DeleteButton: View {

	var hoveringReference: Bool
	var linkViewModel: LinkViewModel
	var itemIndex: Int?
	@State var alertPresented = false

	// If true, link items are deleted in one click
	@AppStorage("instantDeleteLink") var instantDeleteLink = false
	

	var body: some View {
		Button {
			if instantDeleteLink { linkViewModel.remove() } else { alertPresented = true }
		} label: {
			Image(systemName: Icons().delete)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 20, height: 20)
		}
		.buttonStyle(DisplaySheetButtonStyle(hoveringReference: hoveringReference, item: linkViewModel.link))
		.alert(isPresented: $alertPresented) {
			let confirm = Alert.Button.destructive(Text("Confirm")) { linkViewModel.remove() }
			let cancel = Alert.Button.cancel()
			
			return Alert(title: Text("Delete link?"), message: Text("This cannot be undone"), primaryButton: confirm, secondaryButton: cancel)
		}
	}
}

struct DeleteButton_Previews: PreviewProvider {
	static var previews: some View {
		Text("Fix")
	}
}
