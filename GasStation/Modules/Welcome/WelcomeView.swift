//
//  WelcomeView.swift
//  GasStation
//
//  Created by aakash tandukar on 10/23/25.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        ZStack {
            // MARK: - Background Gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.blue,
                    Color.white
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 40) {
                Spacer()
                
                // MARK: - Logo + Title
                VStack(spacing: 20) {
                    Image(systemName: "circle.grid.cross.fill") // Replace with your real logo asset
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                    
                    Text("Argumind")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                // MARK: - Subtitle
                Text("Your AI Assistant for Case Law and Legal Insight.")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .padding(.bottom, 8)
                
                // MARK: - Buttons
                VStack(spacing: 16) {
                    Button(action: {
                        print("Sign In tapped")
                        
                        appState.currentScreen = .login
                    }) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.blue]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .cornerRadius(25)
                            .shadow(radius: 4)
                    }
                    
                    Button(action: {
                        print("Create Account tapped")
                        appState.currentScreen = .signup
                    }) {
                        Text("Create Account")
                            .font(.headline)
                            .foregroundColor(Color.blue)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.blue, lineWidth: 1.5)
                            )
                    }
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 40)
            }
        }
    }
}

//#Preview {
//    WelcomeView()
//}


