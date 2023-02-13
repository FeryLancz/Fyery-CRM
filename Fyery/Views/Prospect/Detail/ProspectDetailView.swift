//
//  ProspectDetailView.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct ProspectDetailView: View {
    @EnvironmentObject var model: FyeryModel
    @ObservedObject var prospect: Prospect
    @State private var callOucomeShowing = false
    
    var body: some View {
        List {
            Section("Personal Information") {
                SplitTextView("First Name:", prospect.firstName)
                SplitTextView("Last Name:", prospect.lastName)
                SplitTextView("Phone Number:", prospect.phoneNumber)
                HStack {
                    Spacer()
                    Button {
                        callOucomeShowing = true
                    } label: {
                        Label("Call", systemImage: "phone")
                    }
                    .sheet(isPresented: $callOucomeShowing) {
                        CallOutcomeView(prospect: prospect)
                    }
                    Spacer()
                }
            }
            
            Section("Concepts") {
                ForEach(model.user.getConcepts(for: prospect)) { concept in
                    NavigationLink(destination: ConceptDetailView(appointment: model.user.getAppointment(for: concept), concept: concept)) {
                        ConceptCellView(appointment: model.user.getAppointment(for: concept), concept: concept)
                    }
                }
            }
            
            Section("Appointments") {
                let appointments = model.user.appointments.filter { appointment in
                    appointment.participant == prospect
                }
                ForEach(appointments) { appointment in
                    AppointmentCellView(appointment)
                }
            }
            
            Section("Events") {
                ForEach(prospect.events) { event in
                    NavigationLink(destination: EventDetailView(for: event)) {
                        EventCellView(event: event)
                    }
                }
            }
        }
        .navigationTitle(prospect.fullName)
    }
}

struct SimpleConceptCellView: View {
    @ObservedObject var concept: Concept
    
    var body: some View {
        Text(concept.state.rawValue)
    }
}



struct ProspectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProspectDetailView(prospect: Prospect())
                .environmentObject(FyeryModel())
        }
    }
}



