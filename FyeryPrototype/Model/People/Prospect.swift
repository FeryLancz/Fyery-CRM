//
//  Prospect.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 26.12.22.
//

import Foundation

class Prospect: Person, Identifiable, ObservableObject, Hashable {
    
    var type: PersonType
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var email: String?
    var birthday: Date?
    var zip: Int?
    var city: String?
    var street: String?
    var job: String?
    var approximateAge: Int?
    var childrenNote: String?
    var maritalStatus: MaritalStatus?
    weak var contactor: Person?
    var contactType: ContactType
    var eligibleAsSalesPartner: Bool?
    var note: String?
    
    @Published var events: [Event] = []
    @Published var concepts: [Concept] = []
    @Published var isCustomer = false
    
    var fullName: String {
        firstName + " " + lastName
    }
    
    init(type: PersonType, firstName: String, lastName: String, phoneNumber: String, contactor: Person?, contactType: ContactType) {
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.contactor = contactor
        self.contactType = contactType
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(phoneNumber)
    }
    
    func addEvent(_ event: Event) {
        events.append(event)
        events.sort(by: {
            $0.date < $1.date
        })
    }
    
    
    
}

extension Prospect: Equatable {
    static func == (lhs: Prospect, rhs: Prospect) -> Bool {
        lhs.fullName == rhs.fullName && lhs.phoneNumber == rhs.phoneNumber
    }
}

extension Prospect {
    
}

enum PersonType: String, CaseIterable {
    case male
    case female
}

enum MaritalStatus: String, CaseIterable {
    case single
    case relationship
    case married
    case divorced
}

enum ContactType: String, CaseIterable {
    case relative
    case friend
    case colleague
    case acquaintance
    case directContact = "direct contact"
    case application
    case other
}
