//
//  Reports.swift
//  GasStation
//
//  Created by aakash tandukar on 10/22/25.
//

import SwiftUI

struct ReportsView: View {
    
    @ObservedObject var viewModel = ReportViewModel()
    //@State var reportName = viewModel
    
    struct Favourite: Identifiable {
        let id = UUID()
        let name: String
        let detail: String
        let subtitle: String
    }
    
    let favourites: [Favourite] = [
        Favourite(name: "Nga Hew Jie", detail: "Maybank", subtitle: "1569872256456"),
        Favourite(name: "Nga Hew Jie", detail: "Mobile Number", subtitle: "+60124319999"),
        Favourite(name: "Nga Hew Jie", detail: "NRIC (MyKad)", subtitle: "900101011234"),
        Favourite(name: "Nga Hew Jie", detail: "Army/Police ID", subtitle: "AB1234567"),
        Favourite(name: "XYZ SDN BHD", detail: "BRN", subtitle: "BRN88899")
    ]
    
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                
                
                // MARK: - Favourites List
                
                List {
                    ForEach(self.viewModel.reports) { value in
                        HStack(spacing: 16) {
                            ZStack {
                                Circle()
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(width: 50, height: 50)
                                Image(systemName: "person.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(.gray)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(value.name)
                                    .font(.headline)
                                Text("\("Maybank") - \("fav.subtitle")")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("DuitNow Transfer")
            
        }
        .onAppear {
            print("report opening...")
            viewModel.getReportData()
        }
    }
}

#Preview {
    ReportsView()
}
