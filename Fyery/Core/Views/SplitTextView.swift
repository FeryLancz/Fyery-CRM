//
//  SplitTextView.swift
//  Fyery
//
//  Created by Fery Lancz on 28.12.22.
//

import SwiftUI

struct SplitTextView: View {
    var lText: String
    var rText: String
    
    init(_ lText: String, _ rText: String) {
        self.lText = lText
        self.rText = rText
    }
    
    var body: some View {
        HStack {
            Text(lText)
            Spacer()
            Text(rText)
        }
    }
}


struct SplitTextView_Previews: PreviewProvider {
    static var previews: some View {
        SplitTextView("left", "right")
    }
}
