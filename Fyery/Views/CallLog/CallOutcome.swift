//
//  CallOutcome.swift
//  Fyery
//
//  Created by Fery Lancz on 13.02.23.
//

import Foundation

enum CallOutcome: String, CaseIterable {
    case reached = "Reached"
    case voicemailLeft = "Left a Voicemail"
    case notAnswered = "Not Answered"
    case wrongNumber = "Wrong Number"
}
