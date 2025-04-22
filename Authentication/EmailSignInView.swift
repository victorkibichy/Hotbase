//
//  EmailSignInView.swift
//  Hotbase
//
//  Created by Kibichy on 16/04/2025.
//

import SwiftUI

final class EmailSignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("Empty fields")
            return
        }
            let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
            print("Successfully signed in user: \(returnedUserData)")
            print(returnedUserData)
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("Empty fields")
            return
        }
            let returnedUserData = try await AuthenticationManager.shared.signIn(email: email, password: password)
            print("Successfully signed in user: \(returnedUserData)")
            print(returnedUserData)
    }
}


struct EmailSignInView: View {
    
    @StateObject var viewModel = EmailSignInViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
                .padding(.top, 16)
            
            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
                .padding(.top, 16)
            Button {
                Task {
                    do {
                        try await viewModel.signUp()
                        showSignInView = false
                        return
                    }
                    catch {
                        print(error)
                    }
                    do  {
                        try await viewModel.signIn()
                        showSignInView = false
                        return
                    }
                    catch {
                        print(error)
                    }
                }
               
                
            } label: {
                Text("Sign In With Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.blue.opacity(0.9))
                    .cornerRadius(10)
            }
            Spacer()

        }
        .padding()
        .navigationTitle("Sign In with Email")
    }
}

#Preview {
    NavigationStack {
        EmailSignInView(showSignInView: .constant(false))
    }
}
