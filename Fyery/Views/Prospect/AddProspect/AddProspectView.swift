//
//  AddProspectNew.swift
//  Fyery
//
//  Created by Fery Lancz on 17.01.23.
//

import SwiftUI

struct AddProspectView: View {
    @Environment(\.dismiss) var dismiss
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    
    @State private var contactType: ContactType = .relative
    
    @State var sp = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                PrimarySection(title: "Personal Information", verticalSpacing: 10) {
                    PrimaryTextField(input: $firstName, title: "First Name", placeholder: "Max")
                    PrimaryTextField(input: $lastName, title: "Last Name", placeholder: "Mustermann")
                    PrimaryTextField(input: $phoneNumber, title: "phone number", subtitle: "Enter in international format", placeholder: "+43 660 12345678", keyboardType: .phonePad)
                }
                
                PrimarySection(title: "Contact Information", verticalSpacing: 0) {
                    EnumPicker(selection: $contactType, title: "Contact Type")
                    PrimaryTextField(input: $firstName, title: "Contact by")
                    PrimaryTextField(input: $firstName, title: "Advisor")
                }
                
                PrimarySection(title: "Details") {
                    PrimaryTextField(input: $firstName, title: "Current Job")
                    PrimaryTextField(input: $firstName, title: "Approximate Age")
                    PrimaryTextField(input: $firstName, title: "Children")
                    PrimaryTextField(input: $firstName, title: "Marital Status")
                    Divider()
                        .tint(.main)
                    Toggle(isOn: $sp) {
                        Heading3("Interest in additional income")
                    }
                    .tint(.main)
                    Divider()
                        .tint(.main)
                    PrimaryTextField(input: $firstName, title: "Note")
                }
                
                PrimarySection(title: "Address") {
                    PrimaryTextField(input: $firstName, title: "ZIP Code")
                    PrimaryTextField(input: $firstName, title: "City")
                    PrimaryTextField(input: $firstName, title: "Street")
                }
                
                PrimarySection(title: "Extra") {
                    PrimaryTextField(input: $firstName, title: "E-Mail address")
                    PrimaryTextField(input: $firstName, title: "Birthday")
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    PrimaryHeader(title: "Create", title2: "Prospect", logoSystemName: "person")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.confirm)
                            .heading2()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



struct AddProspectNew_Previews: PreviewProvider {
    static var previews: some View {
        AddProspectView()
    }
}


