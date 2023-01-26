//
//  StandardEvents.swift
//  Fyery
//
//  Created by Fery Lancz on 01.01.23.
//

import Foundation

extension Event {
    static func confirmation(of appointment: Appointment) -> Event {
        return Event(
            type: .confirmationCall,
            title: "Appointment confirmed",
            description: "\(appointment.type.rawValue) confirmed for \(appointment.date.formatted())"
        )
    }
    
    static func appointmentDateChanged(of appointment: Appointment, to newDate: Date) -> Event {
        return Event(
            type: .confirmationCall,
            title: "Appointment Date changed",
            description: "\(appointment.type.rawValue) date was changed from \(appointment.date.formatted()) to \(newDate.formatted())"
        )
    }
}
