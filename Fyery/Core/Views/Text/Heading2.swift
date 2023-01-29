//
//  Heading2.swift
//  Fyery
//
//  Created by Fery Lancz on 29.01.23.
//

import SwiftUI

struct Heading2: View {
    var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text.uppercased())
            .heading2()
    }
}

struct Heading2_Previews: PreviewProvider {
    static var previews: some View {
        Heading2("Heading 2")
    }
}
