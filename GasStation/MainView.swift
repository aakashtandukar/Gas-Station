//
//  MainView.swift
//  GasStation
//
//  Created by aakash tandukar on 10/23/25.
// for usa gastation 123

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        switch appState.currentScreen {
        case .welcome:
            WelcomeView()
        case .login:
            LoginView()
        case .signup:
            RegistrationView()
        case .dashboard:
            DashboardView()
        }
    }
}
