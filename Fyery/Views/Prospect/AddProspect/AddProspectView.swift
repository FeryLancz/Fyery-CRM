//
//  AddProspectNew.swift
//  Fyery
//
//  Created by Fery Lancz on 17.01.23.
//

import SwiftUI

struct AddProspectView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var user: SalesPartner
    
    @State private var callOutcomeViewShowing = false
    
    @State private var newProspect: Prospect = Prospect()
    
    @State private var personType: ProspectType = .male
    @State private var firstName = ""
    @State private var lastName = ""
    @State var phoneNumber = ""
    
    @State private var contactType: ContactType = .notSelected
    @State private var contactor: Prospect = Prospect(type: .female, firstName: "Error in", lastName: "add prospect ", phoneNumber: "contact by picker", contactor: nil, contactType: .relative)
    @State private var advisor = Prospect()
    
    @State private var job = ""
    @State private var approximateAge = ""
    @State private var children = ""
    @State private var maritalStatus: MaritalStatus = .notSelected
    @State private var sp = false
    @State private var note = ""
    
    @State private var zipCode = ""
    @State private var city = ""
    @State private var street = ""
    
    @State private var email = ""
    @State private var birthday = Date()
    
    var presentedFromCallView = false
    
    var buttonDisabled: Bool {
        firstName.isEmpty && lastName.isEmpty || phoneNumber.isEmpty || contactType == .notSelected
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
                    //ArrayPicker(selection: $advisor, array: user.availableAdvisors, title: "Advisor")
                }
                
                PrimarySection(title: "Details") {
                    PrimaryTextField(input: $job, title: "Current Job", placeholder: "Programmer")
                    PrimaryTextField(input: $approximateAge, title: "Approximate Age", placeholder: "26")
                    PrimaryTextField(input: $children, title: "Children / Age note", placeholder: "2 y.o. and 5 y.o.")
                    EnumPicker(selection: $maritalStatus, title: "Marital Status")
//                    Divider()
//                        .tint(.main)
//                    Toggle(isOn: $sp) {
//                        Heading3("Interest in additional income")
//                    }
//                    .tint(.main)
//                    Divider()
//                        .tint(.main)
                    PrimaryTextField(input: $note, title: "Note")
                }
                
                ExpandableSection(title: "Address") {
                    PrimaryTextField(input: $zipCode, title: "ZIP Code", placeholder: "1010")
                    PrimaryTextField(input: $city, title: "City", placeholder: "Wien")
                    PrimaryTextField(input: $street, title: "Street", placeholder: "Straße 238/26")
                }
                
                ExpandableSection(title: "E-Mail & Birthday") {
                    PrimaryTextField(input: $firstName, title: "E-Mail address", placeholder: "max.muster@gmail.com")
                    PrimaryDatePicker(title: "Birthday", date: $birthday)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    PrimaryHeader(title: "Create", title2: "Prospect", logoSystemName: "person")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        newProspect = Prospect(type: personType, firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, contactor: contactor, contactType: contactType)
                        if !job.isEmpty { newProspect.job = job }
                        if !approximateAge.isEmpty { newProspect.approximateAge = Int(approximateAge) }
                        if !children.isEmpty { newProspect.childrenNote = children }
                        if maritalStatus != .notSelected { newProspect.maritalStatus = maritalStatus }
                        if !note.isEmpty { newProspect.note = note }
                        
                        if !zipCode.isEmpty { newProspect.zip = Int(zipCode) }
                        if !city.isEmpty { newProspect.city = city }
                        if !street.isEmpty { newProspect.street = street }
                        
                        if !email.isEmpty { newProspect.email = email }
                        if !birthday.isToday() { newProspect.birthday = birthday }
                        
                        user.addProspect(newProspect)
                        
                        if !presentedFromCallView {
                            dismiss()
                        } else {
                            callOutcomeViewShowing = true
                            
                        }
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(buttonDisabled ? .gray : .confirm)
                            .heading2()
                    }
                    .disabled(buttonDisabled)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $callOutcomeViewShowing, onDismiss: dismissView) {
                CallOutcomeView(prospect: newProspect)
            }
        }
    }
    
    func dismissView() {
        dismiss()
    }
}



struct AddProspectNew_Previews: PreviewProvider {
    static var previews: some View {
        AddProspectView()
            .environmentObject(SalesPartner(generateTestData: true))
    }
}


