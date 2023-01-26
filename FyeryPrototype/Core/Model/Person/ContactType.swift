//
//  ContactType.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 26.01.23.
//

import Foundation

enum ContactType: String, CaseIterable {
    case relative
    case friend
    case colleague
    case acquaintance
    case directContact = "direct contact"
    case application
    case other
}
