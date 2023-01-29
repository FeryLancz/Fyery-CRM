//
//  Title2.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import SwiftUI

struct Heading3: View {
    var text: String
    
    init(_ text: String) {self.text = text}
    
    var body: some View {
        Text(text.uppercased())
            .heading3()
            .kerning(0.5)
    }
}

struct Title3_Previews: PreviewProvider {
    static var previews: some View {
        Heading3("Title 2")
    }
}
