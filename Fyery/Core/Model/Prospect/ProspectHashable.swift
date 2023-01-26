//
//  ProspectHashable.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import Foundation

extension Prospect: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(phoneNumber)
    }
}
