//
//  GasStationApp.swift
//  GasStation
//
//  Created by aakash tandukar on 5/15/25.
//

import SwiftUI
import SwiftData

enum AppScreen {
    case welcome
    case login
    case signup
    case dashboard
}

class AppState: ObservableObject {
    @Published var currentScreen: AppScreen = .welcome
}

@main
struct GasStationApp: App {
    
    // Bridge AppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) private var scenePhase
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            //ContentView()
            //LoginView()
            //DashboardView()
            
            MainView().environmentObject(appState)
        }
        .onChange(of: scenePhase) { newPhase in
            switch newPhase {
            case .active:
                print("App is Active")
            case .inactive:
                print("App is Inactive")
            case .background:
                print("App moved to Background")
                handleAppDidEnterBackground()
            @unknown default:
                break
            }
        }
        .modelContainer(sharedModelContainer)
    }
    
    func handleAppDidEnterBackground() {
            // Perform saving tasks, stop timers, pause network calls, etc.
            print("Perform background cleanup here")
        }
    
}
