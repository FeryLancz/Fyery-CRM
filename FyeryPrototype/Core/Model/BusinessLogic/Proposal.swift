//
//  Proposal.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 31.12.22.
//

import Foundation

class Proposal: ObservableObject, Identifiable {
    @Published var division: ContractDivision = .notSelected
    @Published var type: ProposalType = .change
    
    @Published var prevCompany: Company = .notSelected
    @Published var prevPremium: Double = 0.0
    @Published var newCompany: Company = .notSelected
    @Published var newPremium: Double = 0.0
    
    @Published var preSelection = true
    @Published var selection = true
}
