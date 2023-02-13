//
//  RoundedImageButton.swift
//  Fyery
//
//  Created by Fery Lancz on 02.02.23.
//

import SwiftUI

struct RoundedImageButton: View {
    var title: String
    var systemName: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                ZStack {
                    Circle()
                        .foregroundColor(.main)
                        .frame(maxWidth: 50)
                    Image(systemName: systemName)
                        .foregroundColor(.white)
                        .padding()
                }
            }
            Heading3(title)
        }
        .frame(width: 80)
    }
}

struct RoundedImageButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImageButton(title: "Call", systemName: "phone.fill") {
            
        }
    }
}
