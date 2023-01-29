//
//  ProspectExtensionPickable.swift
//  Fyery
//
//  Created by Fery Lancz on 29.01.23.
//

import Foundation

extension Prospect: Pickable {
    var pickerLabel: String {
        self.fullName
    }
}
