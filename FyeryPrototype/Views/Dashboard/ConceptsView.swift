//
//  ConceptsView.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 31.12.22.
//

import SwiftUI

struct ConceptsView: View {
    @EnvironmentObject private var user: SalesPartner
    var body: some View {
        List(user.appointments) { appointment in
            if let concept = appointment.concept {
                NavigationLink(destination: ConceptDetailView(appointment: appointment, concept: concept)) {
                    ConceptCellView(appointment: appointment, concept: concept)
                }
            }
        }
    }
}

struct ConceptsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ConceptsView()
                .environmentObject(SalesPartner())
        }
    }
}

struct ConceptCellView: View {
    @ObservedObject var appointment: Appointment
    @ObservedObject var concept: Concept
    
    var body: some View {
        HStack {
            Text(appointment.participant.fullName)
            if concept.state == .created {
                Image(systemName: "pencil.circle.fill")
                    .foregroundColor(.orange)
            } else if concept.state == .ready {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
            Spacer()
            Text(appointment.date.formatted())
        }
    }
}
