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
    @State private var email = ""
    @State var personType: PersonType = .male
    @State var sp = false
    
    var body: some View {
        VStack(spacing: 0) {
            AddProspectHeaderView {
                dismiss()
            }
            ScrollView(.vertical) {
                PrimarySection(title: "Contact Information") {
                    PrimaryTextField(input: $firstName, title: "First Name", placeholder: "Max")
                    PrimaryTextField(input: $lastName, title: "Last Name", placeholder: "Mustermann")
                    PrimaryTextField(input: $phoneNumber, title: "phone number", subtitle: "Enter in international format", placeholder: "+43 660 12345678", keyboardType: .phonePad)
                    PrimaryTextField(input: $email, title: "email address", placeholder: "max.muster@efs.at", keyboardType: .emailAddress)
                }
                
                PrimarySection(title: "Reccomendation Data") {
                    PrimaryTextField(input: $firstName, title: "Contact by")
                    PrimaryTextField(input: $firstName, title: "Contact Type")
                }
                
                PrimarySection(title: "Personal Information") {
                    PrimaryTextField(input: $firstName, title: "Current Job")
                    PrimaryTextField(input: $firstName, title: "Approximate Age")
                    PrimaryTextField(input: $firstName, title: "Children")
                    Divider()
                        .tint(.main)
                    Toggle(isOn: $sp) {
                        Heading3("Interest in additional income")
                    }
                    .tint(.main)
                }
                
                PrimarySection(title: "Address") {
                    PrimaryTextField(input: $firstName, title: "ZIP Code")
                    PrimaryTextField(input: $firstName, title: "City")
                    PrimaryTextField(input: $firstName, title: "Street")
                }
                
            }
            
        }
        .applyBackground()
    }
}



struct AddProspectNew_Previews: PreviewProvider {
    static var previews: some View {
        AddProspectView()
    }
}


