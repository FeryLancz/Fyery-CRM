//
//  Proposal.swift
//  Fyery
//
//  Created by Fery Lancz on 31.12.22.
//

import Foundation

class Proposal: ObservableObject, Identifiable, Codable {
    @Published var division: ContractDivision = .notSelected
    @Published var type: ProposalType = .change
    
    @Published var prevCompany: Company = .notSelected
    @Published var prevPremium: Double = 0.0
    @Published var newCompany: Company = .notSelected
    @Published var newPremium: Double = 0.0
    
    @Published var preSelection = true
    @Published var selection = true
    
    init() { }
    
    // MARK: - Codable Implementation
    enum CodingKeys: String, CodingKey {
        case division
        case type
        case prevCompany
        case prevPremium
        case newCompany
        case newPremium
        case preSelection
        case selection
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.division = try container.decode(ContractDivision.self, forKey: .division)
        self.type = try container.decode(ProposalType.self, forKey: .type)
        self.prevCompany = try container.decode(Company.self, forKey: .prevCompany)
        self.prevPremium = try container.decode(Double.self, forKey: .prevPremium)
        self.newCompany = try container.decode(Company.self, forKey: .newCompany)
        self.newPremium = try container.decode(Double.self, forKey: .newPremium)
        self.preSelection = try container.decode(Bool.self, forKey: .preSelection)
        self.selection = try container.decode(Bool.self, forKey: .selection)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(division, forKey: .division)
        try container.encode(type, forKey: .type)
        try container.encode(prevCompany, forKey: .prevCompany)
        try container.encode(prevPremium, forKey: .prevPremium)
        try container.encode(newCompany, forKey: .newCompany)
        try container.encode(newPremium, forKey: .newPremium)
        try container.encode(preSelection, forKey: .preSelection)
        try container.encode(selection, forKey: .selection)
    }
}
