//
//  NormalText.swift
//  Fyery
//
//  Created by Fery Lancz on 29.01.23.
//

import SwiftUI

struct NormalText: View {
    var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .normal()
    }
}

struct NormalText_Previews: PreviewProvider {
    static var previews: some View {
        NormalText("Normal Text")
    }
}
