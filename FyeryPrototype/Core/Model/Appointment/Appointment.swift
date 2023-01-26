//
//  Appointment.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 26.12.22.
//

import Foundation

class Appointment: ObservableObject, Identifiable {
    
    let type: AppointmentType
    @Published var date: Date
    @Published private var _events: [Event] = []
    var events: [Event] { _events }
    
    var shortDesignation: String { AppointmentType.abbreviation[self.type]! }
  
    func addEvent(_ newEvent: Event) {
        self._events.append(newEvent)
        self._events.sort(by: <)
        self.participant.addEvent(newEvent)
    }
    
    @Published var isConfirmed = false
    @Published var isClassified = false
    
    @Published var concept: Concept?
    
    private weak var _participant: Person?
    var participant: Person {
        get {
            if let p = _participant {
                return p
            }
            return Prospect()
        }
        set { _participant = newValue }
    }
    var participantFullName: String {
        participant.fullName
    }
    
    init(type: AppointmentType, date: Date, participant: Person) {
        self.type = type
        self.date = date
        self.participant = participant
        if type == .consulting {
            concept = Concept()
        }
    }
    
    func isInFuture() -> Bool {
        self.date.isInFuture()
    }
}

// MARK: - Mutating Functions
extension Appointment {
    func confirm() {
        participant.addEvent(Event.confirmation(of: self))
        self.isConfirmed = true
    }
    
    func changeDate(to newDate: Date) {
        participant.addEvent(Event.appointmentDateChanged(of: self, to: newDate))
        self.date = newDate
    }
    
    func cancel() {
        self.isClassified = true
    }
}
