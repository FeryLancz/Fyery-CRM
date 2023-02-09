//
//  CallButton.swift
//  Fyery
//
//  Created by Fery Lancz on 09.02.23.
//

import SwiftUI

struct CallButton: View {
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                
                Circle()
                    .foregroundColor(.confirm)
                    .frame(maxWidth: 75)
                Image(systemName: "phone.fill")
                    .foregroundColor(.background)
                    .font(.title)
                    .bold()
            }
        }
    }
}
struct CallButton_Previews: PreviewProvider {
    static var previews: some View {
        CallButton { }
            .previewLayout(.sizeThatFits)
    }
}
