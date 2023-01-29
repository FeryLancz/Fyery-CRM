//
//  ArrayPicker.swift
//  Fyery
//
//  Created by Fery Lancz on 29.01.23.
//

import SwiftUI

struct ArrayPicker<T: Hashable & Identifiable & ObservableObject & Pickable>: View {
    @Binding var selection: T
    var array: [T]
    var title: String
    var subtitle: String?
    
    var body: some View {
        InputContainer(title: title, subtitle: subtitle) {
            Picker(title, selection: $selection) {
                ForEach(array, id: \.self) { element in
                    Text(element.pickerLabel)
                }
            }
            .tint(.input)
            .pickerStyle(.menu)
        }
    }
}

//struct ArrayPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        ArrayPicker(selection: .constant(1), array: [1, 2, 3], title: "Array Picker")
//    }
//}
