//
//  DashboardView.swift
//  GasStation
//
//  Created by aakash tandukar on 5/15/25.
//

import SwiftUI

struct DashboardItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let iconName: String
    let showNotification: Bool
}

struct DashboardView: View {
    
    @State private var showWeb = false

    let items = [
        DashboardItem(title: "Dashboard", iconName: "dashboard", showNotification: false),
        DashboardItem(title: "Task Manager", iconName: "taskmanager", showNotification: false),
        DashboardItem(title: "Reports", iconName: "reports", showNotification: false),
        DashboardItem(title: "Staff Manager", iconName: "staffmanager", showNotification: false),
        DashboardItem(title: "Inventory", iconName: "inventory", showNotification: false),
        DashboardItem(title: "Settings", iconName: "settings", showNotification: false),
        DashboardItem(title: "Document", iconName: "documents", showNotification: false),
        DashboardItem(title: "Message", iconName: "message", showNotification: false),
        DashboardItem(title: "Webview", iconName: "taskmanager", showNotification: false),
        DashboardItem(title: "Camera", iconName: "settings", showNotification: false),
    ]

    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {

                // Top Bar
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)

                    VStack(alignment: .leading) {
                        Text("Welcome")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        Text("Henry Jecob")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    Spacer()
                }
                .padding()
                .background(Color.blue)

                // Grid
                LazyVGrid(columns: columns) {
                    ForEach(items) { item in
                        NavigationLink(value: item) {
                            VStack(spacing: 5) {

                                ZStack(alignment: .topTrailing) {
                                    Image(item.iconName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(10)

                                    if item.showNotification {
                                        Circle()
                                            .fill(Color.red)
                                            .frame(width: 10, height: 10)
                                            .offset(x: 8, y: -8)
                                    }
                                }

                                Text(item.title)
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                            }
                            .frame(maxWidth: 90)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.05),
                                    radius: 4, x: 0, y: 2)
                        }
                    }
                }
                .padding()

                Spacer()
            }
            .background(Color(.systemGray6).ignoresSafeArea())

            // ✅ navigationDestination
            .navigationDestination(for: DashboardItem.self) { item in
                
                if item.title == "Reports" {
                    ReportsView()
                } else if item.title == "Webview" {
                    //showWeb = true
                    SafariWebView(url: URL(string: "https://apple.com")!)
                } else{
                    ReportsView()
                }
                
                
            }
        }
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
