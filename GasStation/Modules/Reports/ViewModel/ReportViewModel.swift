//
//  ReportViewModel.swift
//  GasStation
//
//  Created by aakash tandukar on 10/22/25.
//

import Foundation
import Combine
import SwiftUI

class ReportViewModel: ObservableObject {

    private var cancellables = Set<AnyCancellable>()
    @Published var reports = [Report]()
    
    func getReportData() {
        NetworkManager.shared.getData(endpoint: .objects, type: Report.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            }
            receiveValue: { [weak self] reportData in
                self?.reports = reportData
                print(self?.reports[0].name)
            }
            .store(in: &cancellables)
        }
}


