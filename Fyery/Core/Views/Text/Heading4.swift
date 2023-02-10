//
//  Heading4.swift
//  Fyery
//
//  Created by Fery Lancz on 10.02.23.
//

import SwiftUI

struct Heading4: View {
    var text: String
    
    init(_ text: String) { self.text = text }
    
    var body: some View {
        Text(text.uppercased())
            .heading4()
    }
}

struct Heading4_Previews: PreviewProvider {
    static var previews: some View {
        Heading4("Heading 4")
    }
}
