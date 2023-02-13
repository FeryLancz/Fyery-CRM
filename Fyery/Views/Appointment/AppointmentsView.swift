//
//  AppoinetmentsView.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct AppointmentsView: View {
    @EnvironmentObject var model: FyeryModel
    @State var searchString: String = ""
    
    var body: some View {
        List {
            Section("Past Appointments") {
                ForEach(model.user.appointments.filter { $0.date < Date() && !$0.isClassified }) { appointment in
                    AppointmentCellView(appointment)
                }
                NavigationLink(destination: PastAppointmentsView()) {
                    Text("Past Appointments")
                }
            }
            
            Section("Upcoming") {
                ForEach(model.user.appointments.filter {$0.date >= Date() }) { appointment in
                    AppointmentCellView(appointment)
                }
            }
        }
        .largeNavigationTitle("Appointments")
    }
}

struct AppointmentCellView: View {
    @ObservedObject var appointment: Appointment
    
    let calendar = Calendar.current
    
    init(_ appointment: Appointment) {
        self.appointment = appointment
    }
    
    var body: some View {
        NavigationLink(destination: AppointmentDetailView(appointment: appointment)) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(appointment.participantFullName)
                    Text(appointment.type.rawValue)
                        .font(.footnote)
                }
                if calendar.isDateInTomorrow(appointment.date) || calendar.isDateInToday(appointment.date) {
                    if appointment.isConfirmed {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "circle")
                            .foregroundColor(.yellow)
                    }
                }
                Spacer()
                Text(appointment.date.formatted())
                    .font(.callout)
            }
        }
    }
}

struct AppoinetmentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppointmentsView()
                .environmentObject(FyeryModel())
        }
    }
}
