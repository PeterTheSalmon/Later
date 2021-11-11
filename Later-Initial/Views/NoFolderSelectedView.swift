//
//  NoFolderSelectedView.swift
//  Later-Initial
//
//  Created by Peter Salmon on 2021-11-09.
//

import SwiftUI

struct NoFolderSelectedView: View {
    var body: some View {
		VStack {
			Text("Select a folder to view saved links")
				.font(.title)
				.padding()
			Image(systemName: "folder")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 100)
		}
    }
}

struct NoFolderSelectedView_Previews: PreviewProvider {
    static var previews: some View {
        NoFolderSelectedView()
    }
}
