//
//  ConfirmationCallOutcomeView.swift
//  Fyery
//
//  Created by Fery Lancz on 28.12.22.
//

import SwiftUI

struct ConfirmationCallOutcomeView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var appointment: Appointment
    @State var selection: ConfirmationCallOutcome = .confirmed
    @State private var selectedDate = Date()
    let calendar = Calendar.current
    
    enum ConfirmationCallOutcome: String, CaseIterable {
        case confirmed = "Confirmed"
        case notReached = "Not Reached"
        case dateChanged = "Date Changed"
        case followUp = "Follow Up"
        case canceled = "Canceled"
    }
    
    init(for appointment: Appointment) {
        self.appointment = appointment
    }
    
    var body: some View {
        NavigationView {
            List {
                Picker("Call Outcome", selection: $selection) {
                    ForEach(ConfirmationCallOutcome.allCases, id: \.self) { outcome in
                        Text(outcome.rawValue)
                            .tag(outcome)
                    }
                }
                .pickerStyle(.inline)
                
                if selection == .dateChanged {
                    Text("Select new Date")
                } else if selection == .followUp {
                    Text("Select date for Follow Up")
                }
                
                if selection == .dateChanged || selection == .followUp {
                    DatePicker("Date:", selection: $selectedDate)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("OK") {
                        switch selection {
                        case .confirmed:
                            appointment.confirm()
                        case .notReached:
                            appointment.addEvent(Event(type: .confirmationCall, title: "Not reached for appointment confirmation", description: ""))
                        case .dateChanged:
                            appointment.changeDate(to: selectedDate)
                        case .followUp:
                            appointment.cancel()
                        case .canceled:
                            appointment.cancel()
                        }
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ConfirmationCallOutcomeView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationCallOutcomeView(for: Appointment())
    }
}
