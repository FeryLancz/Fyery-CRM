//
//  NewProspectDetailView.swift
//  Fyery
//
//  Created by Fery Lancz on 02.02.23.
//

import SwiftUI
import MapKit

struct NewProspectDetailView: View {
    @EnvironmentObject var user: SalesPartner
    @ObservedObject var prospect: Prospect
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(.vertical) {
            ZStack {
                Heading1(prospect.initials)
                    .bold()
                Circle()
                    .stroke(lineWidth: 2)
                    .frame(maxWidth: 50)
                    .foregroundColor(.main)
            }
            Title(prospect.fullName.uppercased())
            Subtitle(Date().formatted())
                .padding(.bottom, 15)
            HStack() {
                RoundedImageButton(title: "Call", systemName: "phone") {
                    Call.callNumber(prospect.phoneNumber)
                }
                RoundedImageButton(title: "Concept", systemName: "folder") { }
                RoundedImageButton(title: "Event", systemName: "plus") { }
            }
            PrimarySection(title: "COntact Info") {
                DetailItemView(title: "phone number", systemName: "phone", text: prospect.phoneNumber)
                if let email = prospect.email {
                    DetailItemView(title: "email-address", systemName: "mail", text: email)
                }
                DetailItemView(title: "contact by", systemName: "person", text: prospect.contactType.rawValue + " of " + prospect.contactorFullName)
            }
            
            if prospect.detailsAvailable {
                PrimarySection(title: "Details", insideSpacing: 10) {
                    if let job = prospect.job {
                        DetailItemView(title: "current job", systemName: "figure.walk", text: job)
                    }
                    if let approximateAge = prospect.approximateAge {
                        //TODO: change so birthday is displayed when available, else approximate age
                        DetailItemView(title: "approximate age", systemName: "figure.walk", text: prospect.birthday?.formatted() ?? String(approximateAge))
                    }
                    if let childrenNote = prospect.childrenNote {
                        DetailItemView(title: "children note", systemName: "figure.walk", text: childrenNote)
                    }
                    if let maritalStatus = prospect.maritalStatus {
                        DetailItemView(title: "marital status", systemName: "figure.walk", text: maritalStatus.rawValue)
                    }
                    if let note = prospect.note {
                        DetailItemView(title: "note", systemName: "figure.walk", text: note)
                    }
                }
            }
            
            if prospect.addressAvailable {
                PrimarySection(title: "Address") {
                    HStack(spacing: 0) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.action)
                            .font(.title2)
                            .padding(.horizontal)
                        VStack(alignment: .leading) {
                            NormalText(prospect.street ?? "")
                            NormalText(String(prospect.zip ?? 0) + " " + (prospect.city ?? ""))
                        }
                        Spacer()
                    }
                    .onTapGesture {
                        
                    }
                }
            }
            
            if !prospect.events.isEmpty {
                PrimarySection(title: "Events") {
                    ScrollView(.vertical) {
                        ForEach(prospect.events) { event in
                            EventCellView(event: event)
                        }
                    }
                }
            }
            
            if !prospect.concepts.isEmpty {
                PrimarySection(title: "Concepts") {
                    ScrollView(.vertical) {
                        ForEach(prospect.concepts) { concept in
                            ConceptCellView(appointment: user.getAppointment(for: concept), concept: concept)
                        }
                    }
                }
            }
            
            PrimarySection(title: "Appointments") {
                let appointments = user.appointments.filter { appointment in
                    appointment.participant == prospect
                }
                ForEach(appointments) { appointment in
                    AppointmentCellView(appointment)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailItemView: View {
    var title: String
    var systemName: String
    var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Label(title.uppercased(), systemImage: systemName)
                .heading4()
            NormalText(text)
        }
        .customAlign(.leading)
    }
}

struct NewProspectDetailView_Previes: PreviewProvider {
    
    static var previews: some View {
        NavigationStack {
            NewProspectDetailView(prospect: Prospect())
                .environmentObject(SalesPartner())
        }
    }
}
