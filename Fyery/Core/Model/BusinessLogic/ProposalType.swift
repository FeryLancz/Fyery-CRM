//
//  ProposalType.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import Foundation

enum ProposalType: String, CaseIterable, Codable {
    case change = "Change"
    case newContract = "New Contract"
    case cancellation = "Cancellation"
}
