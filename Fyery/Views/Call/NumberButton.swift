//
//  NumberButton.swift
//  Fyery
//
//  Created by Fery Lancz on 09.02.23.
//

import SwiftUI

struct NumberButton: View {
    var title: String
    @Binding var text: String
    
    
    var body: some View {
        Button {
            text += title
        } label: {
            ZStack {
                Text(title)
                    .font(.title)
                    .bold()
                Circle()
                    .stroke(lineWidth: 3)
                    .frame(maxWidth: 75)
            }
        }
    }
}

struct NumberButton_Previews: PreviewProvider {
    static var previews: some View {
        NumberButton(title: "1", text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
