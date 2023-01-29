//
//  AddProspectNew.swift
//  Fyery
//
//  Created by Fery Lancz on 17.01.23.
//

import SwiftUI

struct AddProspectView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var user: SalesPartner
    @State private var personType: PersonType = .male
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    
    @State private var contactType: ContactType = .relative
    @State private var contactor: Prospect = Prospect(type: .female, firstName: "Error in", lastName: "add prospect ", phoneNumber: "contact by picker", contactor: nil, contactType: .relative, advisor: nil)
    @State private var advisor = Prospect()
    
    @State private var job = ""
    @State private var approximateAge = 0
    @State private var children = ""
    @State private var maritalStatus: MaritalStatus = .single
    @State private var sp = false
    @State private var note = ""
    
    var buttonDisabled: Bool {
        firstName.isEmpty && lastName.isEmpty || phoneNumber.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                PrimarySection(title: "Personal Information", verticalSpacing: 10) {
                    EnumPickerSegmented(selection: $personType, title: "Gender")
                    PrimaryTextField(input: $firstName, title: "First Name", placeholder: "Max")
                    PrimaryTextField(input: $lastName, title: "Last Name", placeholder: "Mustermann")
                    PrimaryTextField(input: $phoneNumber, title: "phone number", subtitle: "Enter in international format", placeholder: "+43 660 12345678", keyboardType: .phonePad)
                }
                
                PrimarySection(title: "Contact Information", verticalSpacing: 0) {
                    EnumPicker(selection: $contactType, title: "Contact Type")
                    ArrayPicker(selection: $contactor, array: user.availableContactors, title: "Contact by")
                    ArrayPicker(selection: $advisor, array: user.availableAdvisors, title: "Advisor")
                }
                
                PrimarySection(title: "Details") {
                    PrimaryTextField(input: $job, title: "Current Job", placeholder: "Programmer")
                    //PrimaryTextField(input: $approximateAge, title: "Approximate Age")
                    PrimaryTextField(input: $children, title: "Children / Age note", placeholder: "2 y.o. and 5 y.o.")
                    EnumPicker(selection: $maritalStatus, title: "Marital Status")
                    Divider()
                        .tint(.main)
                    Toggle(isOn: $sp) {
                        Heading3("Interest in additional income")
                    }
                    .tint(.main)
                    Divider()
                        .tint(.main)
                    PrimaryTextField(input: $note, title: "Note")
                }
                
                // TODO: - Expandable Sections for Address and Details
//                PrimarySection(title: "Address") {
//                    PrimaryTextField(input: $firstName, title: "ZIP Code")
//                    PrimaryTextField(input: $firstName, title: "City")
//                    PrimaryTextField(input: $firstName, title: "Street")
//                }
//
//                PrimarySection(title: "Extra") {
//                    PrimaryTextField(input: $firstName, title: "E-Mail address")
//                    PrimaryTextField(input: $firstName, title: "Birthday")
//                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    PrimaryHeader(title: "Create", title2: "Prospect", logoSystemName: "person")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let newProspect = Prospect(type: personType, firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, contactor: contactor, contactType: contactType, advisor: advisor)
                        if !job.isEmpty { newProspect.job = job }
                        if !children.isEmpty { newProspect.childrenNote = children }
                        newProspect.maritalStatus = maritalStatus
                        newProspect.eligibleAsSalesPartner = sp
                        if !note.isEmpty { newProspect.note = note }
                            
                        user.addProspect(newProspect)
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(buttonDisabled ? .gray : .confirm)
                            .heading2()
                    }
                    .disabled(buttonDisabled)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



struct AddProspectNew_Previews: PreviewProvider {
    static var previews: some View {
        AddProspectView()
            .environmentObject(SalesPartner(generateTestData: true))
    }
}


