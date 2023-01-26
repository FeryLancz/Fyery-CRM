//
//  ProspectConvenienceVariables.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import Foundation

extension Prospect {
    var lastContact: Date {
        return Date() - 60*60*24*3
    }
    var contectorFullName: String {
        return "Fery Lancz"
    }
}
