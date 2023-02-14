//
//  CallLogView.swift
//  Fyery
//
//  Created by Fery Lancz on 13.02.23.
//

import SwiftUI

struct CallLogView: View {
    @Environment(\.dismiss) var dismiss
    @State private var outcome: CallOutcome = .reached
    @State private var appointmentScheduled = false
    @State private var appointmentType: AppointmentType = .analysis
    @State private var appointmentDate = Date.placeholder
    
    @State private var comment = ""
    
    // TODO: - Initializers for seperate cases, or split it into 3 views, split better
//    init(for appointment: Appointment) {
//
//    }
//
//    init() {
//
//    }
//
//    init(with prospect: Prospect) {
//
//    }
    
    var callType: CallType
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Call Outcome", selection: $outcome) {
                    ForEach(CallOutcome.allCases, id: \.self) { option in
                        Text(option.rawValue)
                            .tag(option)
                    }
                }
                .pickerStyle(.inline)
                
                if outcome == .reached || outcome == .voicemailLeft {
                    switch callType {
                    case .general:
                        Text("G")
                    case .onAppointment:
                        Toggle("Appointment scheduled", isOn: $appointmentScheduled)
                        if appointmentScheduled {
                            Picker("Appointment Type", selection: $appointmentType) {
                                ForEach(AppointmentType.allCases, id: \.self) { type in
                                    Text(type.rawValue)
                                        .tag(type)
                                }
                            }
                            .pickerStyle(.inline)
                            
                            DatePicker("Date:", selection: $appointmentDate)
                        }
                    case .onConfirmation:
                        Toggle("Appointment confirmed", isOn: $appointmentScheduled)
                    }
                }
                
                Section("Note") {
                    TextField("Comment", text: $comment)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        
    }
}

struct CallLogView_Previews: PreviewProvider {
    static var previews: some View {
        CallLogView(callType: .onAppointment)
    }
}
