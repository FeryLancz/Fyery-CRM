//
//  ContactType.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import Foundation

enum ContactType: String, CaseIterable, Codable {
    case notSelected = "select contact type"
    case relative
    case friend
    case colleague
    case acquaintance
    case directContact = "direct contact"
    case application
    case other
}
