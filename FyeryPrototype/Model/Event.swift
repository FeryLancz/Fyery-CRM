//
//  Event.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 26.12.22.
//

import Foundation
import SwiftUI

class Event: Identifiable, ObservableObject {
    let type: EventType
    let title: String
    let description: String
    let date: Date
    
    init(type: EventType, title: String, description: String, date: Date = Date()) {
        self.type = type
        self.title = title
        self.description = description
        self.date = date
    }
    
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
    }
    
    static let EventImageSystemName: [EventType: String] = [
        .callOnAppointment: "phone",
        .confirmationCall: "mail",
        .appointmentPerformed: "",
        .conceptCreated: "",
        .conceptFinished: ""
    ]
    
    
}
