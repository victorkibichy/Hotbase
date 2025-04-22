//
//  RootView.swift
//  Hotbase
//
//  Created by Kibichy on 17/04/2025.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                SettingsView(showSignInView: $showSignInView)
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil 
            
        }
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack {
                AuthView(showsignInView: $showSignInView)
            }
            
        }
    }
}

#Preview {
    RootView()
}
