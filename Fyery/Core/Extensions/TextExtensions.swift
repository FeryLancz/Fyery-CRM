//
//  TextExtensions.swift
//  Fyery
//
//  Created by Fery Lancz on 27.01.23.
//

import SwiftUI

extension Text {
    func title() -> Text {
        self
            .font(.title)
            .fontWeight(.heavy)
            .kerning(1.0)
            .foregroundColor(.main)
    }
}
