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
        InputContainer(title: title, subtitle: subtitle) {
            Picker(selection: $selection, label: Text(title)) {
                ForEach(Array(T.allCases), id: \.self) {
                    Text($0.rawValue).tag($0)
                }
            }
            .tint(.input)
            .pickerStyle(.menu)
        }
    }
}

struct EnumPicker_Previews: PreviewProvider {
    static var previews: some View {
        EnumPicker(selection: .constant(ContactType.relative), title: "Enum Picker")
            .previewLayout(.sizeThatFits)
    }
}
