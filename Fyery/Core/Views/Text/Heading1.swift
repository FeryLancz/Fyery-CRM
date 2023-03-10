//
//  Heading1.swift
//  Fyery
//
//  Created by Fery Lancz on 28.01.23.
//

import SwiftUI

struct Heading1: View {
    var text: String
    
    init(_ text: String) { self.text = text }
    
    var body: some View {
        Text(text)
            .heading1()
            .kerning(0.5)
    }
}

struct Heading1_Previews: PreviewProvider {
    static var previews: some View {
        Heading1("Heading 1")
    }
}
