//
//  Subtitle.swift
//  Fyery
//
//  Created by Fery Lancz on 29.01.23.
//

import SwiftUI

struct Subtitle: View {
    var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .subtitle()
            .kerning(1.0)
    }
}

struct Subtitle_Previews: PreviewProvider {
    static var previews: some View {
        Subtitle("Subtitle")
    }
}
