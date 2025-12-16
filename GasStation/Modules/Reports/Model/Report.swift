//
//  Report.swift
//  GasStation
//
//  Created by aakash tandukar on 10/22/25.
//


import Foundation

// MARK: - Product Model
struct Report: Identifiable, Codable {
    var id: String
    var name: String
    var data: ReportData?
}

// MARK: - Product Data
struct ReportData: Codable {
    // Use optional values for flexible decoding (since not all products share the same fields)
    var color: String?
    var capacity: String?
    var capacityGB: Int?
    var price: Double?
    var generation: String?
    var year: Int?
    var cpuModel: String?
    var hardDiskSize: String?
    var strapColour: String?
    var caseSize: String?
    var description: String?
    var screenSize: Double?
    var generationName: String?
    
    // Custom keys to handle mixed naming from your JSON
    enum CodingKeys: String, CodingKey {
        case color = "color"
        case capacity = "capacity"
        case capacityGB = "capacity GB"
        case price = "price"
        case generation = "generation"
        case year = "year"
        case cpuModel = "CPU model"
        case hardDiskSize = "Hard disk size"
        case strapColour = "Strap Colour"
        case caseSize = "Case Size"
        case description = "Description"
        case screenSize = "Screen size"
        case generationName = "Generation"
    }
}
