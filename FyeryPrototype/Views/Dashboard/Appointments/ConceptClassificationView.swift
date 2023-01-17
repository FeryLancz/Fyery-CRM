//
//  ConceptClassificationView.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 02.01.23.
//

import SwiftUI

struct ConceptClassificationView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var user: SalesPartner
    @ObservedObject var appointment: Appointment
    
    var body: some View {
        VStack() {
            if let concept = appointment.concept {
                ScrollView(.vertical) {
                    ForEach(concept.proposals) { proposal in
                        ExtractedView(concept: concept, proposal: proposal)
                    }
                }
                
            } else {
                Text("TODO: No Concept created and Consulting appointment due.")
                    .multilineTextAlignment(.center)
            }
        }
        .smallNavigationTitle("\(appointment.participant.fullName)'s Concept")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("OK") {
                    user.closeConsulting(for: appointment.participant, in: appointment)
                    dismiss()
                }
            }
        }
    }
}

struct ConceptClassificationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ConceptClassificationView(appointment: Appointment())
        }
    }
}

struct ExtractedView: View {
    @ObservedObject var concept: Concept
    @ObservedObject var proposal: Proposal
    @State var editPorposalShowing = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("\(proposal.type.rawValue) \(proposal.division.rawValue)")
                if proposal.type == .cancellation || proposal.type == .change {
                    Text("\(proposal.prevCompany.rawValue): \(String(format: "%.2f€", proposal.prevPremium))")
                        .font(.footnote)
                }
                if proposal.type == .newContract || proposal.type == .change {
                    Text("\(proposal.newCompany.rawValue): \(String(format: "%.2f€", proposal.newPremium))")
                        .font(.footnote)
                }
            }
            Spacer()
            Divider()
            Button {
                proposal.preSelection = true
            } label: {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
            Divider()
            Button {
                editPorposalShowing = true
            } label: {
                Image(systemName: "pencil.circle.fill")
                    .foregroundColor(.orange)
            }
            .sheet(isPresented: $editPorposalShowing) {
                AddProposalView(concept: concept, proposal: proposal)
            }
            Divider()
            Button {
                proposal.preSelection = false
            } label: {
                Image(systemName: "x.circle.fill")
                    .foregroundColor(.red)
            }
            Divider()
        }
        .padding()
        .background {
            proposal.preSelection ? Color.green.opacity(0.25) : Color.red.opacity(0.25)
        }
    }
}
