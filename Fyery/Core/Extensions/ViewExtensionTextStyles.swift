//
//  ViewExtensionTextStyles.swift
//  Fyery
//
//  Created by Fery Lancz on 29.01.23.
//

import SwiftUI

extension View {
    func title() -> some View {
        self
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.main)
    }
    
    func subtitle() -> some View {
        self
            .font(.body)
            .foregroundColor(.utility)
    }
    
    func normal() -> some View {
        self
            .font(.body)
            .foregroundColor(.main)
    }
    
    func subtext() -> some View {
        self
            .font(.footnote)
            .foregroundColor(.utility)
    }
    
    func heading1() -> some View {
        self
            .font(.title2)
            .foregroundColor(.main)
    }
    
    func heading2() -> some View {
        self
            .font(.body)
            .fontWeight(.bold)
            .foregroundColor(.main)
    }
    
    func heading3() -> some View {
        self
            .font(.subheadline)
            .foregroundColor(.main)
    }
}
