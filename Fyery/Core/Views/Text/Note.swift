//
//  Note.swift
//  Fyery
//
//  Created by Fery Lancz on 29.01.23.
//

import SwiftUI

struct Note: View {
    var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .note()
    }
}

struct Note_Previews: PreviewProvider {
    static var previews: some View {
        Note("Note")
    }
}
