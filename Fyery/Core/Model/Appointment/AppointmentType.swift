//
//  AppointmentType.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import Foundation

enum AppointmentType: String, Codable, CaseIterable {
    case analysis = "Analysis"
    case consulting = "Consulting"
    case customerFolder = "Customer Folder"
    case service = "Service"
    
    static let abbreviation: [AppointmentType: String] = [
        .analysis: "A",
        .consulting: "B",
        .customerFolder: "KO",
        .service: "S",
    ]
}
