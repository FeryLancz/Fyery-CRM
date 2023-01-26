//
//  Client.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 26.12.22.
//

import Foundation

class Client: Person, Identifiable, ObservableObject, Equatable {
    var isCustomer: Bool = true
    
    var concepts: [Concept] = []
    
    func addEvent(_ event: Event) {
        events.append(event)
        events.sort(by: {
            $0.date < $1.date
        })
    }
    
    
    @Published var firstName: String
    @Published var lastName: String
    @Published var phoneNumber: String
    
    var events: [Event] = []
    
    var fullName: String {
        firstName + " " + lastName
    }
    
    init(firstName: String = "Heinz", lastName: String = "Ketchup", phoneNumber: String = "+43 699 81698213") {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
    }
    
    static func == (lhs: Client, rhs: Client) -> Bool {
        lhs.fullName == rhs.fullName && lhs.phoneNumber == rhs.phoneNumber
    }
}
