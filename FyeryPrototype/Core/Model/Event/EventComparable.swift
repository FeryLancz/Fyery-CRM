//
//  EventComparable.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 26.01.23.
//

import Foundation

extension Event: Comparable {
    static func < (lhs: Event, rhs: Event) -> Bool {
        lhs.date < rhs.date
    }
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.title == rhs.title && lhs.date == rhs.date
    }
}
