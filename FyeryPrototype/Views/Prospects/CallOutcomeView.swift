//
//  CallOutcomeView.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct CallOutcomeView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var user: SalesPartner
    @ObservedObject var prospect: Prospect
    @State private var selection = 0
    @State private var selectedDate = Date()
    private let options = ["not reached", "wrong number", "follow up", "not interestes", "appointment scheduled"]
    
    var body: some View {
        NavigationView {
            List {
                Picker(selection: $selection, label: Text("Call Outcome")) {
                    ForEach(0..<options.count, id: \.self) {
                        Text(options[$0])
                    }
                }
                .pickerStyle(.inline)
                if selection == 4 || selection == 2 {
                    DatePicker("Date:", selection: $selectedDate)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("OK") {
                        let newEvent = Event(type: .callOnAppointment, title: "Call", description: options[selection])
                        prospect.events.append(newEvent)
                        
                        if selection == 4 {
                            let newAppointment = Appointment(type: .analysis, date: selectedDate, participant: prospect)
                            user.appointments.append(newAppointment)
                        }
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

struct CallOutcomeView_Previews: PreviewProvider {
    static var previews: some View {
        CallOutcomeView(prospect: Prospect())
    }
}
