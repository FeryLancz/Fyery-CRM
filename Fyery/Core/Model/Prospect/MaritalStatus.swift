//
//  MaritalStatus.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import Foundation

enum MaritalStatus: String, CaseIterable {
    case notSelected = "select marital status"
    case single
    case relationship
    case married
    case divorced
}
