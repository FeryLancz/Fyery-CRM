//
//  Event.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 26.12.22.
//

import Foundation
import SwiftUI

class Event: Identifiable, ObservableObject {
    let type: EventType
    let title: String
    let description: String
    let date: Date
    
    init(type: EventType, title: String, description: String, date: Date = Date()) {
        self.type = type
        self.title = title
        self.description = description
        self.date = date
    }
}

