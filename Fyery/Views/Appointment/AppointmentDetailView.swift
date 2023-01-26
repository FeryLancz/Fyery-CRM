//
//  AppointmentDetailView.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct AppointmentDetailView: View {
    @ObservedObject var appointment: Appointment
    @State var callOutcomeViewShowing = false
    @State var appointmentOutcomeViewShowing = false
    @State var debugDate = Date()
    
    var body: some View {
        List {
            Section("Appointment Info") {
                AppointmentHeaderView(appointment: appointment)
            }
            
            Section("Add Information") {
                if appointment.isInFuture() {
                    if !appointment.isConfirmed {
                        Button("Call to Confirm Appointment") { callOutcomeViewShowing = true }
                            .sheet(isPresented: $callOutcomeViewShowing) { ConfirmationCallOutcomeView(for: appointment) }
                    } else {
                        Text("Waiting for Appointment to happen")
                    }
                } else {
                    if !appointment.isClassified {
                        Button("Classify") { appointmentOutcomeViewShowing = true }
                            .sheet(isPresented: $appointmentOutcomeViewShowing) { AppointmentOutcomeView(appointment) }
                    } else {
                        Text("Appointment Classified")
                    }
                }
            }
            
            Section("Appointment History") {
                AppointmentHistoryView(appointment)
            }
            
            Section("Debug") {
                DatePicker("Date:", selection: $debugDate)
                Button("Change Date") {
                    appointment.changeDate(to: debugDate)
                }
            }
        }
        .largeNavigationTitle(appointment.shortDesignation + " " + appointment.participant.lastName)
    }
}

private struct AppointmentHeaderView: View {
    @ObservedObject var appointment: Appointment
    
    var body: some View {
        SplitTextView("Type:", appointment.type.rawValue)
        SplitTextView("Participant: ", appointment.participantFullName)
        SplitTextView("Date:", appointment.date.formatted())
    }
}

private struct AppointmentHistoryView: View {
    @ObservedObject var appoinment: Appointment
    
    init(_ appointment: Appointment) { self.appoinment = appointment}
 
    var body: some View {
        ForEach(appoinment.events) { event in
            EventCellView(event: event)
        }
    }
}

struct AppointmentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppointmentDetailView(appointment: Appointment())
        }
    }
}
