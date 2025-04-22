//
//  AuthView.swift
//  Hotbase
//
//  Created by Kibichy on 16/04/2025.
//

import SwiftUI

struct AuthView: View {
    
    @Binding var showsignInView: Bool
    
    var body: some View {
        VStack {
            Spacer ()

            NavigationLink {
                EmailSignInView(showSignInView: $showsignInView)
            }
            label: {
                Text("Sign Up With Email")
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
            .navigationTitle("Sign In")
    }
}

#Preview {
    NavigationStack{
        AuthView(showsignInView: .constant(false))
    }
}
