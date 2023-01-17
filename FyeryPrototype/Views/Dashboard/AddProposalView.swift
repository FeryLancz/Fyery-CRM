//
//  AddProposalView.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 02.01.23.
//

import SwiftUI

struct AddProposalView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var concept: Concept
    @ObservedObject var proposal: Proposal = Proposal()
    @State var newPremium = ""
    @State var prevPremium = ""
    private var editing = false
    
    init(concept: Concept) {
        self.concept = concept
    }
    init(concept: Concept, proposal: Proposal) {
        self.init(concept: concept)
        self.proposal = proposal
        self.newPremium = String(proposal.newPremium)
        self.prevPremium = String(proposal.prevPremium)
        editing = true
    }
    
    var body: some View {
        NavigationView{
            Form {
                Picker("Type:", selection: $proposal.type) {
                    ForEach(ProposalType.allCases, id: \.self) {
                        Text($0.rawValue)
                            .id($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.vertical)
                
                Picker("Division:", selection: $proposal.division) {
                    ForEach(ContractDivision.allCases, id: \.self) {
                        Text($0.rawValue)
                            .id($0)
                    }
                }
                .pickerStyle(.menu)
                .labelsHidden()
                
                if proposal.type == .change || proposal.type == .cancellation {
                    Section("Previous Contract") {
                        Picker("Company:", selection: $proposal.prevCompany) {
                            ForEach(Company.allCases, id: \.self) {
                                Text($0.rawValue)
                                    .id($0)
                            }
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                        TextField("Premium", text: $prevPremium)
                            .keyboardType(.decimalPad)
                    }
                }
                
                if proposal.type == .change || proposal.type == .newContract {
                    Section("New Contract") {
                        Picker("Company:", selection: $proposal.newCompany) {
                            ForEach(Company.allCases, id: \.self) {
                                Text($0.rawValue)
                                    .id($0)
                            }
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                        TextField("Premium", text: $newPremium)
                            .keyboardType(.decimalPad)
                    }
                }
            }
            .smallNavigationTitle(editing ? "Edit Proposal" : "Add Proposal")
            .toolbar {
                Button("OK") {
                    proposal.newPremium = Double(newPremium) ?? 0.0
                    proposal.prevPremium = Double(prevPremium) ?? 0.0
                    if !editing {
                        concept.proposals.append(proposal)
                    }
                    dismiss()
                }
            }
        }
    }
}

struct AddProposalView_Previews: PreviewProvider {
    static var previews: some View {
        AddProposalView(concept: Concept())
    }
}
