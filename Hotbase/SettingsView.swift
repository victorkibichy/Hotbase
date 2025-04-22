//
//  SettingsView.swift
//  Hotbase
//
//  Created by Kibichy on 17/04/2025.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    
    func signOut() throws {
       try AuthenticationManager.shared.signOut()
    }
    func resetPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        
        guard let email = authUser?.email else {
            throw URLError(.fileDoesNotExist)
        }
      try await  AuthenticationManager.shared.resetPassword(email: email)
    }
    
    func updateEmail() async throws {
        let email = "hello@123.com"
        
        
      try await  AuthenticationManager.shared.updateEmail(email: email)
    }
    func updatePassword() async throws {
        let password = "WERTfjgh!@#$%^&*()"
        
        
      try await  AuthenticationManager.shared.updatePassword(password: password)
    }
    
}

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    var body: some View {
        List{
            
            Button("Log Out") {
                Task {
                    do {
                        try viewModel.signOut()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            }
            
            
            
            emailSections
            
        }
        .navigationBarTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView(showSignInView: .constant(false))
    }
}

extension SettingsView {
    private var emailSections: some View {
        Section {
            
            Button("Reset Password") {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print( "Password reset email sent")
                    } catch {
                        print(error)
                    }
                }
            }
            Button("Update Email") {
                Task {
                    do {
                        try await viewModel.updateEmail()
                        print( "Updated email")
                    } catch {
                        print(error)
                    }
                }
            }
            Button("Update Password") {
                Task {
                    do {
                        try await viewModel.updatePassword()
                        print( "Updated Password")
                    } catch {
                        print(error)
                    }
                }
            }
        } header: { Text("Email Functions")
                    }
    }
}
