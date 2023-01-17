//
//  DateExtension.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 30.12.22.
//

import Foundation

extension Date {
    func isInFuture() -> Bool {
        self > Date()
    }
    
    func timeOfDay() -> TimeOfDay {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        switch hour {
        case 5..<12:
            return .morning
        case 12..<17:
            return .afternoon
        case 17..<22:
            return .evening
        default:
            return .night
        }
    }
}

enum TimeOfDay {
    case morning
    case afternoon
    case evening
    case night
}
