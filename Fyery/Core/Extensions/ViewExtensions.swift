//
//  ViewExtensions.swift
//  Fyery
//
//  Created by Fery Lancz on 30.12.22.
//

import SwiftUI

extension View {
    func largeNavigationTitle(_ title: String) -> some View {
        self
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.large)
    }
    
    func smallNavigationTitle(_ title: String) -> some View {
        self
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
    
    func customCenter() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    func customAlign(_ alignment: HorizontalAlignment) -> some View {
        HStack(spacing: 0) {
            if alignment == .trailing || alignment == .center {
                Spacer()
            }
            self
            if alignment == .leading || alignment == .center {
                Spacer()
            }
        }
    }
    
    
}

extension Image {
    func title() -> some View {
        self
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.main)
    }
}

