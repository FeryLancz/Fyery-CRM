//
//  UXPrototypeComment.swift
//  Fyery
//
//  Created by Fery Lancz on 13.02.23.
//

import SwiftUI

struct UXPrototypeComment: View {
    var comment: String
    
    init(_ comment: String) {
        self.comment = comment
    }
    
    var body: some View {
        Text(comment)
            .foregroundColor(.orange)
            .font(.footnote)
    }
}

struct UXPrototypeComment_Previews: PreviewProvider {
    static var previews: some View {
        UXPrototypeComment("UX Prototype Comment")
    }
}
