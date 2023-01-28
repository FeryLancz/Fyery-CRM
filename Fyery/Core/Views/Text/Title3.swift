//
//  Title2.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import SwiftUI

struct Title3: View {
    var text: String
    
    init(_ text: String) {self.text = text}
    
    var body: some View {
        Text(text.uppercased())
            .font(.subheadline)
            .kerning(0.5)
            .foregroundColor(.utility)
    }
}

struct Title3_Previews: PreviewProvider {
    static var previews: some View {
        Title3("Title 2")
    }
}
