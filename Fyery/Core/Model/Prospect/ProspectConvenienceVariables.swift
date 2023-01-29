//
//  ProspectConvenienceVariables.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import Foundation

extension Prospect {
    var lastContact: Date {
        // TODO: chnage function to return lastest event that is communication related
        return Date() - 60*60*24*3
    }
    var contectorFullName: String {
        return "Fery Lancz"
    }
    var initials: String {
        if let fi = firstName.first, let li = lastName.first {
            return String(fi) + String(li)
        }
        return "X"
    }
    var lastInteraction: Date {
        self.events.first!.date
    }
}
