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
    
    /**
     Add an Event to the Appointment the function is called on and the appointments Participant
     
     ```
     a.addEvent(newEvent) // adds newEvent to a and a.participant
     ```
     
     > Warning: Use the addEvent function on the Appointment itself, and not the
     > participant to make sure both get the corresponding Event
     
     - Parameters:
        - newEvent: The Event to be added
     */
    func addEvent(_ newEvent: Event) {
        self._events.append(newEvent)
        self._events.sort(by: { $0.date > $1.date })
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
    
    /**
     Return a Bool to know if the Appointment is in the future or not
     
     ```
     let a = Appointment() // create standard Appointment
     
     a.date = Date() + 60 * 60 * 24 // change date to tomorrow
     a.isInFuture() // returns true
     
     a.date = Date() - 60 * 60 * 24 // change date to yesterday
     a.isInFuture() // returns false
     ```
     
     - Returns: A Bool that is true if the Appointment is in the future and false if it is in the past.
     */
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

// MARK: - Enums
extension Appointment {
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
    }
    
    static private let abbreviation: [AppointmentType: String] = [
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
    
    var shortDesignation: String { Appointment.abbreviation[self.type]! }
}


