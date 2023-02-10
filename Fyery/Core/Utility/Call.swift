//
//  Call.swift
//  Fyery
//
//  Created by Fery Lancz on 09.02.23.
//

import SwiftUI

final class Call {
    static func callNumber(_ number: String) {
        let phone = "tel://"
        let phoneNumberformatted = phone + number.replacingOccurrences(of: " ", with: "")
        guard let url = URL(string: phoneNumberformatted) else {
            return
        }
        UIApplication.shared.open(url)
    }
}
