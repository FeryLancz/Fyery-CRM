//
//  AddProspectView.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct AddProspectView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var user: SalesPartner
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    @State private var type: PersonType = .male
    @State private var contactor: Prospect?
    @State private var contactType: ContactType = .colleague
    @State private var birthdayShowing = false
    @State private var emailAddress = ""
    @State private var city = ""
    @State private var zip = ""
    @State private var street = ""
    @State private var approximateAge = ""
    @State private var birthday = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section("Personal Information") {
                    Picker("Form Of Address", selection: $type) {
                        ForEach(PersonType.allCases, id: \.self) { type in
                            Text(type.rawValue)
                                .tag(type)
                        }
                    }
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Phone Number", text: $phoneNumber)
                    TextField("Approximate Age", text: $approximateAge)
                    
                    if birthdayShowing {
                        DatePicker("Birthday", selection: $birthday, displayedComponents: [.date])
                    } else {
                        Button {
                            withAnimation {
                                birthdayShowing.toggle()
                            }
                        } label: {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                Text("Add Birthday")
                            }
                        }
                    }
                }
                
                Section("Contact Information") {
                    Picker("Contactor", selection: $contactor) {
                        ForEach(user.prospects) { prospect in
                            Text(prospect.fullName)
                                .tag(Optional(prospect))
                        }
                    }
                    Picker("Contact Type", selection: $contactType) {
                        ForEach(ContactType.allCases, id: \.self) { type in
                            Text(type.rawValue)
                                .tag(type)
                        }
                    }
                }
                
                Section("Address") {
                    TextField("City", text: $city)
                    TextField("ZIP code", text: $zip)
                    TextField("Street", text: $street)
                }
            }
            .navigationTitle("Add Prospect")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        let newProspect = Prospect(type: type, firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, contactor: contactor, contactType: contactType)
                        user.prospects.append(newProspect)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddProspectView_Previews: PreviewProvider {
    static var previews: some View {
        AddProspectView()
            .environmentObject(SalesPartner(generateTestData: true))
    }
}
