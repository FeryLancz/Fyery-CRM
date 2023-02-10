//
//  PrimaryDatePicker.swift
//  Fyery
//
//  Created by Fery Lancz on 09.02.23.
//

import SwiftUI

struct PrimaryDatePicker: View {
    var title: String
    var subtitle: String?
    @Binding var date: Date
    var displayedComponents: DatePickerComponents = .date
    
    var body: some View {
        InputContainer(title: title, subtitle: subtitle) {
            DatePicker("Select Date:", selection: $date, displayedComponents: displayedComponents)
                .tint(.input)
                .pickerStyle(.menu)
                .padding(.horizontal, 10)
        }
    }
}

struct PrimaryDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryDatePicker(title: "asd", date: .constant(Date()))
            .previewLayout(.sizeThatFits)
    }
}
