//
//  SalesPartner.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import Foundation
import SwiftUI

class SalesPartner: Identifiable, ObservableObject, Codable {
    var id: Int
    
    var type: ProspectType
    var firstName: String
    var lastName: String
    var email: String?
    var phoneNumber: String
    
    @Published var currentUnitsMonthly = 378.12
    @Published var goalUnitsMonthly = 500.0
    
    @Published var prospects:[Prospect] = []
    @Published var salesPartners: [SalesPartner] = []
    @Published var appointments: [Appointment] = []
    
    init(type: ProspectType, firstName: String, lastName: String, phoneNumber: String, email: String? = nil) {
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.email = email
        
        var hasher = Hasher()
        hasher.combine(self.type)
        hasher.combine(self.firstName)
        hasher.combine(self.lastName)
        hasher.combine(self.phoneNumber)
        id = hasher.finalize()
    }
    
    // MARK: - Codable Implementation
    enum CodingKeys: String, CodingKey {
        case type
        case firstName
        case lastName
        case email
        case phoneNumber
        case currentUnitsMonthly
        case goalUnitsMonthly
        case prospects
        case salesPartners
        case id
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(ProspectType.self, forKey: .type)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        currentUnitsMonthly = try container.decode(Double.self, forKey: .currentUnitsMonthly)
        goalUnitsMonthly = try container.decode(Double.self, forKey: .goalUnitsMonthly)
        prospects = try container.decode([Prospect].self, forKey: .prospects)
        salesPartners = try container.decode([SalesPartner].self, forKey: .salesPartners)
        id = try container.decode(Int.self, forKey: .id)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(currentUnitsMonthly, forKey: .currentUnitsMonthly)
        try container.encode(goalUnitsMonthly, forKey: .goalUnitsMonthly)
        try container.encode(prospects, forKey: .prospects)
        try container.encode(salesPartners, forKey: .salesPartners)
        try container.encode(id, forKey: .id)
    }
    
}
