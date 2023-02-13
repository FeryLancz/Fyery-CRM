//
//  Concept.swift
//  Fyery
//
//  Created by Fery Lancz on 31.12.22.
//

import Foundation

class Concept: ObservableObject, Identifiable, Codable {
    @Published var state: ConceptState = .created
    @Published var proposals: [Proposal] = []
    var totalNewPremium: Double {
        proposals.reduce(0) { sum, proposal in
            sum + proposal.newPremium
        }
    }
    
    var totalPrevPremium: Double {
        proposals.reduce(0) { sum, proposal in
            sum + proposal.prevPremium
        }
    }
    
    var totalSavings: Double {
        totalPrevPremium - totalNewPremium
    }
    
    init() { }
    
    
    // MARK: - Codable Implementation
    enum CodingKeys: CodingKey {
        case state
        case proposals
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        state = try container.decode(ConceptState.self, forKey: .state)
        proposals = try container.decode([Proposal].self, forKey: .proposals)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(state, forKey: .state)
        try container.encode(proposals, forKey: .proposals)
    }
}
