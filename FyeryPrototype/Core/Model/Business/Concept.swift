//
//  Concept.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 31.12.22.
//

import Foundation

class Concept: ObservableObject, Identifiable {
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
    
    enum ConceptState: String {
        case created
        case ready
        case closed
    }
}
