//
//  ViewExtension.swift
//  Fyery
//
//  Created by Fery Lancz on 17.01.23.
//

import SwiftUI

extension View {
    func applyBackground() -> some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            self
        }
    }
}

