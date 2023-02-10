//
//  EnumPickerSegmented.swift
//  Fyery
//
//  Created by Fery Lancz on 30.01.23.
//

import SwiftUI

struct EnumPickerSegmented<T: Hashable & RawRepresentable & CaseIterable>: View where T.RawValue == String {
    @Binding var selection: T
    var title: String
    var subtitle: String?
    
    var body: some View {
        InputContainer(title: title, subtitle: subtitle, alignment: .center) {
            Picker(selection: $selection, label: Text(title)) {
                ForEach(Array(T.allCases), id: \.self) {
                    Text($0.rawValue).tag($0)
                }
            }
            .tint(.input)
            .pickerStyle(.segmented)
        }
    }
}

struct EnumPickerSegmented_Previews: PreviewProvider {
    static var previews: some View {
        EnumPickerSegmented(selection: .constant(ProspectType.male), title: "Person Type")
            .previewLayout(.sizeThatFits)
    }
}
