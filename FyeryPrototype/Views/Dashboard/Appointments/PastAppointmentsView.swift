//
//  PastAppointmentsView.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 30.12.22.
//

import SwiftUI

struct PastAppointmentsView: View {
    @EnvironmentObject var user: SalesPartner
    
    var body: some View {
        List {
            ForEach(user.appointments.filter { $0.date < Date() && $0.isClassified == true }) { appointment in
                AppointmentCellView(appointment)
            }
        }
        .largeNavigationTitle("Past Appointments")
    }
}

struct PastAppointmentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PastAppointmentsView()
                .environmentObject(SalesPartner())
        }
    }
}
