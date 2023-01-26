//
//  ProspectEquatable.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 26.01.23.
//

import Foundation

extension Prospect: Equatable {
    static func == (lhs: Prospect, rhs: Prospect) -> Bool {
        lhs.fullName == rhs.fullName && lhs.phoneNumber == rhs.phoneNumber
    }
}
