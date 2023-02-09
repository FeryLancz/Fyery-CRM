//
//  CallPad.swift
//  Fyery
//
//  Created by Fery Lancz on 09.02.23.
//

import SwiftUI

struct CallPad: View {
    @Binding var input: String
    var callAction: () -> Void
    var body: some View {
        Grid(horizontalSpacing: 25, verticalSpacing: 25) {
            GridRow {
                NumberButton(title: "1", text: $input)
                NumberButton(title: "2", text: $input)
                NumberButton(title: "3", text: $input)
            }
            GridRow {
                NumberButton(title: "4", text: $input)
                NumberButton(title: "5", text: $input)
                NumberButton(title: "6", text: $input)
            }
            GridRow {
                NumberButton(title: "7", text: $input)
                NumberButton(title: "8", text: $input)
                NumberButton(title: "9", text: $input)
            }
            GridRow {
                NumberButton(title: "+", text: $input)
                NumberButton(title: "0", text: $input)
                NumberButton(title: "#", text: $input)
            }
            GridRow {
                Text("")
                CallButton {
                    callAction()
                }
                DeleteButton(text: $input)
            }
        }
    }
}

struct CallPad_Previews: PreviewProvider {
    static var previews: some View {
        CallPad(input: .constant(""), callAction: { })
            .previewLayout(.sizeThatFits)
    }
}
