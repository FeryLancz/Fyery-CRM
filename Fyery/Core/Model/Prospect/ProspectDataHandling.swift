//
//  ProspectDataHandling.swift
//  Fyery
//
//  Created by Fery Lancz on 10.02.23.
//

import Foundation

extension Prospect {
    func addEvent(_ event: Event) {
        events.append(event)
        events.sort(by: <)
    }
}
