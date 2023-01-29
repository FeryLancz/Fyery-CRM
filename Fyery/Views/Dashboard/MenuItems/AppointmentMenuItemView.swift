//
//  AppointmentMenuItem.swift
//  Fyery
//
//  Created by Fery Lancz on 29.01.23.
//

import SwiftUI

struct AppointmentMenuItemView: View {
    @Binding var appointmentsToday: Int
    @Binding var appointmentsThisWeek: Int
    
    var body: some View {
        NavigationLink(destination: AppointmentsView()) {
            PrimarySection {
                HStack() {
                    VStack(alignment: .leading, spacing: 2) {
                        Heading2("Appointments")
                        NormalText("\(appointmentsToday) today | \(appointmentsThisWeek) this week")
                        NormalText("4 Appointments to classify")
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .heading3()
                }
            }
        }
    }
}

struct AppointmentMenuItem_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentMenuItemView(appointmentsToday: .constant(2), appointmentsThisWeek: .constant(5))
            .previewLayout(.sizeThatFits)
    }
}
