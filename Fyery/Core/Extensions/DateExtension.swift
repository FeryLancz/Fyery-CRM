//
//  DateExtension.swift
//  Fyery
//
//  Created by Fery Lancz on 30.12.22.
//

import Foundation

extension Date {
    func isInFuture() -> Bool {
        self > Date()
    }
    
    func isToday() -> Bool {
        Calendar.current.isDateInToday(self)
    }
    
    func isThisWeek() -> Bool {
        Calendar.current.isDateInThisWeek(self)
    }
    
    func timeOfDay() -> TimeOfDay {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        switch hour {
        case 5..<12:
            return .morning
        case 12..<18:
            return .afternoon
        case 18..<22:
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
