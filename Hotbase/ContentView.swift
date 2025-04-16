//
//  ContentView.swift
//  Hotbase
//
//  Created by Kibichy on 16/04/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "tray.and.arrow.down.fill")
           
                .imageScale(.large)
            Image(systemName: "folder.badge.minus")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("ud!")
                .bold()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
