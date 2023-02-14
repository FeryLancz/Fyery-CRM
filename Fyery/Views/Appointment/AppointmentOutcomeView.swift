//
//  AppointmentOutcomeView.swift
//  Fyery
//
//  Created by Fery Lancz on 01.01.23.
//

import SwiftUI

struct AppointmentOutcomeView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var model: FyeryModel
    @ObservedObject private var appointment: Appointment
    @State private var selectedOutcome: AppointmentOutcome = .performed
    @State private var selectedDate = Date()
    @State private var comment = ""
    enum AppointmentOutcome: String, CaseIterable {
        case performed = "Performed as Planned"
        case noShow = "Not Showed Up"
        case followUp = "Follow Up"
        case undesired = "Undesired to Continue"
    }
    
    init(_ appointment: Appointment) { self.appointment = appointment }
    
    var body: some View {
        NavigationView {
            List {
                Picker("Outcome:", selection: $selectedOutcome) {
                    ForEach(AppointmentOutcome.allCases, id: \.self) {
                        Text($0.rawValue)
                            .id($0)
                    }
                }
                .pickerStyle(.inline)
                
                switch appointment.type {
                case .analysis:
                    if selectedOutcome == .performed {
                        Text("Select Date for Consulting")
                        DatePicker("Date:", selection: $selectedDate)
                    }
                    if selectedOutcome == .followUp {
                        Text("Select Date for Follow Up")
                        DatePicker("Date:", selection: $selectedDate)
                    }
                    if selectedOutcome == .undesired {
                        Text("Add Note to the Appointment")
                        TextField("Note", text: $comment)
                    }
                case .consulting:
                    if selectedOutcome == .performed {
                        NavigationLink(destination: ConceptClassificationView(appointment: appointment)) {
                            Text("Classify Consulting")
                        }
                    }
                    if selectedOutcome == .followUp {
                        Text("Select Date for Follow Up")
                        DatePicker("Date:", selection: $selectedDate)
                    }
                    if selectedOutcome == .undesired {
                        Text("Add Note to the Appointment")
                        TextField("Note", text: $comment)
                    }
                case .customerFolder:
                    Text("TODO")
                case .service:
                    Text("TODO")
                }
            }
            .smallNavigationTitle("Select Outcome")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("OK") {
                        switch appointment.type {
                        case .analysis:
                            switch selectedOutcome {
                            case .performed:
                                let newEvent = Event(type: .appointmentPerformed, title: "Succesful Analysis", description: "Analysis conducted as planned")
                                appointment.addEvent(newEvent)
                                appointment.isClassified = true
                                let consultingAppointment = Appointment(type: .consulting, date: selectedDate, participant: appointment.participant)
                                model.user.addAppointment(consultingAppointment)
                            case .noShow:
                                let newEvent = Event(type: .appointmentNoShow, title: "Didn't show up to Analysis", description: "Didn't show up to Analysis")
                                appointment.addEvent(newEvent)
                                appointment.isClassified = true
                            case .followUp:
                                let newEvent = Event(type: .appointmentFollowUp, title: "Analysis to Follow Up", description: comment)
                                appointment.addEvent(newEvent)
                            case .undesired:
                                let newEvent = Event(type: .appointmentBreak, title: "Analysis done, no Consulting", description: comment)
                                appointment.addEvent(newEvent)
                            }
                        case .consulting:
                            break
                        case .customerFolder:
                            break
                        case .service:
                            break
                        }
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AppointmentOutcomeView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentOutcomeView(Appointment())
    }
}
