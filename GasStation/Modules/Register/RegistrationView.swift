//
//  RegistrationView.swift
//  GasStation
//
//  Created by aakash tandukar on 10/23/25.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var appState: AppState
    @State private var surname = "Petr"
    @State private var name = "Samsonov"
    @State private var dob = "21.03.1988"
    @State private var country = "Russian"
    @State private var area = "Tver region"
    @State private var city = "Tver"

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                // MARK: - Header
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 12) {
                        Image(systemName: "doc.text.magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding(8)
                            .background(Circle().fill(Color.white.opacity(0.3)))
                        
                        VStack(alignment: .leading) {
                            Text("Full registration")
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text("12 basic steps and account created")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(red: 0.85, green: 0.93, blue: 1.0)) // light blue background
                
                // MARK: - Form
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Personal data")
                            .font(.headline)
                            .padding(.bottom, 8)
                        
                        CustomTextField(label: "Surname", text: $surname)
                        CustomTextField(label: "Name", text: $name)
                        CustomTextField(label: "Date of birth", text: $dob)
                        CustomTextField(label: "Country", text: $country)
                        CustomTextField(label: "Area", text: $area)
                        CustomTextField(label: "City", text: $city)
                        
                        Text("Account settings")
                            .font(.headline)
                            .padding(.top, 24)
                        
                        Button(action: {
                            print("Sign Up pressed")
                            appState.currentScreen = .dashboard
                        }) {
                            Text("Sign up")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(12)
                                .shadow(radius: 3)
                        }
                        .padding(.top, 12)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color.white)
                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 3)
                    )
                    .padding(.horizontal)
                    .padding(.top, -24)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .background(Color(red: 0.85, green: 0.93, blue: 1.0).ignoresSafeArea())
        
        
    }
}

// MARK: - Reusable TextField
struct CustomTextField: View {
    var label: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
            TextField("", text: $text)
                .textFieldStyle(.plain)
                .padding(.vertical, 8)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.5)),
                    alignment: .bottom
                )
        }
    }
}

#Preview {
    RegistrationView()
}
