//
//  LoginView.swift
//  GasStation
//
//  Created by aakash tandukar on 5/15/25.
//

import SwiftUI
import SwiftData
import Alamofire





struct LoginView: View {
    
    @EnvironmentObject var appState: AppState
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 24) {
            
            // Logo
            Image("gs-logo") // Add logo to Assets and name it "logo"
                .resizable()
                .scaledToFit()
                .frame(height: 60)
                .padding(.top, 40)

            // Email field
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .keyboardType(.emailAddress)

            // Password field
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            // Forgot Password link
            HStack {
                Spacer()
                Button("Forgot Password?") {
                    // Handle forgot password
                }
                .font(.footnote)
                .foregroundColor(.blue)
            }

            // Login button
            Button(action: {
                // Handle login action
                print("go to dashboard")
                print("User entered: \(email)")
                appState.currentScreen = .dashboard
                
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(6)
            }
            .padding(.top, 8)
            
            Spacer()
        }
        .padding()
        .frame(height: 400)
        .frame(maxWidth: 400)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 10)
        .padding()
        .background(Color(.white))
    }
}

//#Preview {
//    //ContentView()
//    LoginView(isLoggedIn: self.$isLoggedIn)
//}

