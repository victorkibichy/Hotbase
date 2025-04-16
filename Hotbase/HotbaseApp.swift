//
//  HotbaseApp.swift
//  Hotbase
//
//  Created by Kibichy on 16/04/2025.
//

import SwiftUI
import FirebaseCore

@main
struct HotbaseApp: App {
    init () {
        FirebaseApp.configure()
        print("Configured Firebase")   
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
