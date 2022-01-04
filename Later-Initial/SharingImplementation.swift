//
//  SharingImplementation.swift
//  Later
//
//  Created by Peter Salmon on 2022-01-02.
//

import Foundation
import SwiftUI
import AppKit

struct SharingsPicker: NSViewRepresentable {
	@Binding var isPresented: Bool
	var sharingItems: [Any] = []
	
	func makeNSView(context: Context) -> NSView {
		let view = NSView()
		return view
	}
	
	func updateNSView(_ nsView: NSView, context: Context) {
		if isPresented {
			let picker = NSSharingServicePicker(items: sharingItems)
			picker.delegate = context.coordinator
			
			// !! MUST BE CALLED IN ASYNC, otherwise blocks update
			DispatchQueue.main.async {
				picker.show(relativeTo: .zero, of: nsView, preferredEdge: .minY)
			}
		}
	}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(owner: self)
	}
	
	class Coordinator: NSObject, NSSharingServicePickerDelegate {
		let owner: SharingsPicker
		
		init(owner: SharingsPicker) {
			self.owner = owner
		}
		
		func sharingServicePicker(_ sharingServicePicker: NSSharingServicePicker, didChoose service: NSSharingService?) {
			
			// do here whatever more needed here with selected service
			
			sharingServicePicker.delegate = nil   // << cleanup
			self.owner.isPresented = false        // << dismiss
		}
	}
}
