//
//  ConceptDetailView.swift
//  Fyery
//
//  Created by Fery Lancz on 02.01.23.
//

import SwiftUI

struct ConceptDetailView: View {
    @ObservedObject var appointment: Appointment
    @ObservedObject var concept: Concept
    @State var addProposalViewShowing = false
    @State var editProposalViewShowing = false
    
    var body: some View {
        VStack {
            Text(concept.state.rawValue)
                .font(.callout)
            List {
                if concept.state == .created {
                    Button {
                        addProposalViewShowing = true
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                            Text("add Proposal")
                        }
                    }
                }
                ForEach(concept.proposals) { proposal in
                    ProposalCellView(proposal)
                        .swipeActions(edge: .leading) {
                            Button("Edit") {
                                editProposalViewShowing = true
                            }
                            .tint(.orange)
                        }
                        .gesture(concept.state == .ready ? DragGesture() : nil)
                        .sheet(isPresented: $editProposalViewShowing) {
                            AddProposalView(concept: concept, proposal: proposal)
                        }
                }
                .onDelete(perform: delete)
                .deleteDisabled(concept.state == .ready)
                
                
            }
            if concept.state == .ready {
                VStack {
                    Text("\(concept.proposals.count) Proposals for Change")
                    if concept.totalSavings > 0 {
                        Text("Total Benefit of \(String(format: "%.2f", concept.totalSavings))€")
                    }
                }
                .padding(.bottom)
            }
        }
        .smallNavigationTitle("Concept for \(appointment.participant.fullName)")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if concept.state == .created {
                    Button {
                        withAnimation {
                            concept.state = .ready
                        }
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    }
                } else if concept.state == .ready {
                    Button {
                        withAnimation {
                            concept.state = .created
                        }
                    } label: {
                        Image(systemName: "pencil.circle.fill")
                            .foregroundColor(.orange)
                    }
                }
            }
        }
        .sheet(isPresented: $addProposalViewShowing) {
            AddProposalView(concept: concept)
        }
    }
    
    func delete(at offsets: IndexSet) {
        concept.proposals.remove(atOffsets: offsets)
    }
}

struct ProposalCellView: View {
    @ObservedObject var proposal: Proposal
    
    init(_ proposal: Proposal) { self.proposal = proposal }
    
    var body: some View {
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
    }
}

struct ConceptDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ConceptDetailView(appointment: Appointment(), concept: Concept(test: true))
                .environmentObject(SalesPartner())
        }
    }
}
