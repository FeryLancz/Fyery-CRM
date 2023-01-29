//
//  Greeting.swift
//  Fyery
//
//  Created by Fery Lancz on 29.01.23.
//

import Foundation

struct Greeting {
    static func appropriate() -> String {
        switch Date().timeOfDay() {
        case .morning:
            return "Good Morning"
        case .afternoon:
            return "Hello"
        case .evening:
            return "Good Evening"
        case .night:
            return "Good Night"
        }
    }
}
