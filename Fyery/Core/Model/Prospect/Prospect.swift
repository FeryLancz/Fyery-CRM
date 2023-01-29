//
//  Prospect.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import Foundation

class Prospect: Person, Identifiable, ObservableObject {
    var phoneNumber: String
    var type: PersonType
    var firstName: String
    var lastName: String
    
    var job: String?
    var approximateAge: Int?
    var childrenNote: String?
    var maritalStatus: MaritalStatus?
    var eligibleAsSalesPartner: Bool?
    var note: String?
    
    var zip: Int?
    var city: String?
    var street: String?
    
    var email: String?
    var birthday: Date?
    
    weak var contactor: Person?
    var contactType: ContactType
    weak var advisor: Person?
    
    @Published var events: [Event] = []
    @Published var concepts: [Concept] = []
    @Published var isCustomer = false
    
    init(type: PersonType, firstName: String, lastName: String, phoneNumber: String, contactor: Person?, contactType: ContactType, advisor: Person?) {
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.contactor = contactor
        self.contactType = contactType
        
        self.addEvent(Event.prospectCreation)
    }
}
