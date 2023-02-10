//
//  Prospect.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import Foundation

class Prospect: Identifiable, ObservableObject {
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
}
