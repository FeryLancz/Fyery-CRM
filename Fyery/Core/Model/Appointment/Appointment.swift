//
//  Appointment.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import Foundation

class Appointment: ObservableObject, Identifiable, Codable {
    
    var type: AppointmentType
    @Published var date: Date
    @Published private var _events: [Event] = []
    @Published var isConfirmed = false
    @Published var isClassified = false
    @Published var concept: Concept?
    private weak var _participant: Prospect?
    
    var events: [Event] { _events }
    
    var shortDesignation: String { AppointmentType.abbreviation[self.type]! }
    
    var participant: Prospect {
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
    
    init(type: AppointmentType, date: Date, participant: Prospect) {
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
    
    // MARK: - Codable Implementation
    enum CodingKeys: String, CodingKey {
        case type
        case date
        case events
        case isConfirmed
        case isClassified
        case concept
        case participant
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(AppointmentType.self, forKey: .type)
        date = try container.decode(Date.self, forKey: .date)
        _events = try container.decode([Event].self, forKey: .events)
        isConfirmed = try container.decode(Bool.self, forKey: .isConfirmed)
        isClassified = try container.decode(Bool.self, forKey: .isClassified)
        concept = try container.decodeIfPresent(Concept.self, forKey: .concept)
        _participant = try container.decodeIfPresent(Prospect.self, forKey: .participant)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(date, forKey: .date)
        try container.encode(_events, forKey: .events)
        try container.encode(isConfirmed, forKey: .isConfirmed)
        try container.encode(isClassified, forKey: .isClassified)
        try container.encodeIfPresent(concept, forKey: .concept)
        try container.encodeIfPresent(_participant, forKey: .concept)
    }

}

// MARK: - Mutating Functions
extension Appointment {
    
    func addEvent(_ newEvent: Event) {
        self._events.append(newEvent)
        self._events.sort(by: <)
        self.participant.addEvent(newEvent)
    }
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
