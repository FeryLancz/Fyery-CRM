//
//  AppointmentType.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import Foundation

enum AppointmentType: String, Codable {
    case analysis = "Analysis"
    case consulting = "Consulting"
    case customerFolder = "Customer Folder"
    case service = "Service"
    case interview = "Interview"
    case closingMeeting = "Closing Meeting"
    case approvalMeeting = "Apporval Meeting"
    case careerMeeting = "Career Meeting"
    case personal = "Personal Meeting"
    
    static let abbreviation: [AppointmentType: String] = [
        .analysis: "A",
        .consulting: "B",
        .customerFolder: "KO",
        .service: "S",
        .interview: "VG",
        .closingMeeting: "AG",
        .approvalMeeting: "FG",
        .careerMeeting: "KG",
        .personal: "PG",
    ]
}
