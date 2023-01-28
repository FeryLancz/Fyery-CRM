//
//  Title.swift
//  Fyery
//
//  Created by Fery Lancz on 27.01.23.
//

import SwiftUI

struct Title: View {
    var text: String
    
    init(_ text: String) { self.text = text }
    
    var body: some View {
        Text(text)
            .title()
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title("Title 1")
    }
}
