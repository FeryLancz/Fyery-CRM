//
//  Prospect.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import Foundation

class Prospect: Identifiable, ObservableObject, Codable {
    var type: ProspectType
    var firstName: String
    var lastName: String
    var email: String?
    var phoneNumber: String
    
    weak var contactor: Prospect?
    var contactType: ContactType
    
    var job: String?
    var approximateAge: Int?
    var birthday: Date?
    var childrenNote: String?
    var maritalStatus: MaritalStatus?
    var note: String?
    
    var zip: Int?
    var city: String?
    var street: String?
    
    @Published var events: [Event] = []
    @Published var appointments: [Appointment] = []
    @Published var concepts: [Concept] = []
    
    @Published var isCustomer = false
    
    init(type: ProspectType, firstName: String, lastName: String, phoneNumber: String, contactor: Prospect?, contactType: ContactType) {
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.contactor = contactor
        self.contactType = contactType
        
        self.addEvent(Event.prospectCreation)
    }
    
    // MARK: - Codable Implementation
    enum CodingKeys: String, CodingKey {
        case type
        case firstName
        case lastName
        case email
        case phoneNumber
        case contactType
        case job
        case approximateAge
        case birthday
        case childrenNote
        case maritalStatus
        case note
        case zip
        case city
        case street
        case events
        case appointments
        case concepts
        case isCustomer
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(ProspectType.self, forKey: .type)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        self.contactType = try container.decode(ContactType.self, forKey: .contactType)
        self.job = try container.decodeIfPresent(String.self, forKey: .job)
        self.approximateAge = try container.decodeIfPresent(Int.self, forKey: .approximateAge)
        self.birthday = try container.decodeIfPresent(Date.self, forKey: .birthday)
        self.childrenNote = try container.decodeIfPresent(String.self, forKey: .childrenNote)
        self.maritalStatus = try container.decodeIfPresent(MaritalStatus.self, forKey: .maritalStatus)
        self.note = try container.decodeIfPresent(String.self, forKey: .note)
        self.zip = try container.decodeIfPresent(Int.self, forKey: .zip)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.street = try container.decodeIfPresent(String.self, forKey: .street)
        self.events = try container.decode([Event].self, forKey: .events)
        self.appointments = try container.decode([Appointment].self, forKey: .appointments)
        self.concepts = try container.decode([Concept].self, forKey: .concepts)
        self.isCustomer = try container.decode(Bool.self, forKey: .isCustomer)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(contactType, forKey: .contactType)
        try container.encodeIfPresent(job, forKey: .job)
        try container.encodeIfPresent(approximateAge, forKey: .approximateAge)
        try container.encodeIfPresent(birthday, forKey: .birthday)
        try container.encodeIfPresent(childrenNote, forKey: .childrenNote)
        try container.encodeIfPresent(maritalStatus, forKey: .maritalStatus)
        try container.encodeIfPresent(note, forKey: .note)
        try container.encodeIfPresent(zip, forKey: .zip)
        try container.encodeIfPresent(city, forKey: .city)
        try container.encodeIfPresent(street, forKey: .street)
        try container.encode(events, forKey: .events)
        try container.encode(appointments, forKey: .appointments)
        try container.encode(concepts, forKey: .concepts)
        try container.encode(isCustomer, forKey: .isCustomer)
    }
}
