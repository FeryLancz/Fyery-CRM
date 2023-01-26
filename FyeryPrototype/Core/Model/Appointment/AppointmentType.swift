//
//  AppointmentType.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 26.01.23.
//

import Foundation

enum AppointmentType: String {
    case analysis = "Analysis"
    case consulting = "Consulting"
    case customerFolder = "Customer Folder"
    case service = "Service"
    case interview = "Interview"
    case closingMeeting = "Closing Meeting"
    case approvalTalk = "Apporval Talk"
    case careerTalk = "Career Talk"
    case personal = "Personal Meeting"
    
    static let abbreviation: [AppointmentType: String] = [
        .analysis: "A",
        .consulting: "B",
        .customerFolder: "KO",
        .service: "S",
        .interview: "VG",
        .closingMeeting: "AG",
        .approvalTalk: "FG",
        .careerTalk: "KG",
        .personal: "PG",
    ]
}
