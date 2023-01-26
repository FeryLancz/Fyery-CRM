//
//  EventType.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import Foundation

enum EventType: String {
    case userInput = "User Input"
    case callOnAppointment = "Call on Appointment"
    case confirmationCall = "Confirmation Call"
    case appointmentPerformed = "Appointment performed"
    case conceptCreated = "Concept created"
    case conceptFinished = "Concept Finished"
    case appointmentNoShow
    case appointmentFollowUp
    case appointmentBreak
    
    static let imageSystemName: [EventType: String] = [
        .callOnAppointment: "phone",
        .confirmationCall: "mail",
        .appointmentPerformed: "",
        .conceptCreated: "",
        .conceptFinished: ""
    ]
}
