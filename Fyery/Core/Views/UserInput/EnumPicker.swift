//
//  PrimaryPicker.swift
//  Fyery
//
//  Created by Fery Lancz on 29.01.23.
//

import SwiftUI

struct EnumPicker<T: Hashable & RawRepresentable & CaseIterable>: View where T.RawValue == String {
    @Binding var selection: T
    var title: String
    var subtitle: String?
    
    var body: some View {
        VStack(spacing: 0) {
            Heading3(title)
                .customAlign(.leading)
                .padding(.bottom, 3)
            Picker(selection: $selection, label: Text(title)) {
                ForEach(Array(T.allCases), id: \.self) {
                    Text($0.rawValue).tag($0)
                }
            }
            .tint(.input)
            .pickerStyle(.menu)
            .customAlign(.leading)
            .background {
                Color.gray.opacity(0.2)
                    .cornerRadius(7, corners: [.topLeft, .topRight])
            }
            Rectangle()
                .frame(height: 3)
                .foregroundColor(.main)
            if let subtitle = subtitle {
                HStack {
                    Note(subtitle)
                    Spacer()
                }
                .padding(.top, 1)
                .padding(.bottom, 5)
            }
        }
    }
}

struct EnumPicker_Previews: PreviewProvider {
    static var previews: some View {
        EnumPicker(selection: .constant(ContactType.relative), title: "Asd")
            .previewLayout(.sizeThatFits)
    }
}
