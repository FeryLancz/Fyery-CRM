//
//  PersonProtocol.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 26.12.22.
//

import Foundation

protocol Person: AnyObject {
    var firstName: String { get }
    var lastName: String { get }
    var phoneNumber: String { get }
    var fullName: String { get }
    var events: [Event] { get set }
    var concepts: [Concept] { get set }
    var isCustomer: Bool { get set }
    func addEvent(_ event: Event)
}
