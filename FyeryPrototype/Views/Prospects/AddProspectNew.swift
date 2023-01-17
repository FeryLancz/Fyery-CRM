//
//  AddProspectNew.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 17.01.23.
//

import SwiftUI

struct AddProspectNew: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    
    var body: some View {
        VStack {
            AddProspectHeaderView()
            ScrollView(.vertical) {
                VStack {
                    HStack {
                        Text("Form 1".uppercased())
                            .foregroundColor(.main)
                        Spacer()
                    }
                    FormInput(title: "First Name", text: $firstName)
                    FormInput(title: "Last Name", text: $lastName)
                    FormInput(title: "Phone Number", text: $phoneNumber)
                }
                HStack {
                    Text("Form 2".uppercased())
                        .foregroundColor(.main)
                    Spacer()
                }
                VStack(spacing: 10) {
                    FormInput2(title: "First Name", input: $firstName)
                    FormInput2(title: "Last Name", input: $lastName)
                    FormInput2(title: "Phone Number", input: $phoneNumber)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct FormInput2: View {
    var title: String
    @Binding var input: String
    
    var body: some View {
        ZStack {
            
            TextField("", text: $input)
                .padding(.bottom)
                .padding(.leading, 5)
                .padding(.bottom, 5)
                .padding(.top, 5)
                .background {
                    Color.gray.opacity(0.2)
            }
            VStack {
                Spacer()
                Rectangle()
                    .frame(height: 3)
                    .foregroundColor(.main)
            }
            VStack {
                Spacer()
                HStack {
                    Text(title)
                        .font(.caption)
                        .foregroundColor(.main)
                        .padding(5)
                    Spacer()
                }
            }
        }
    }
}

struct AddProspectNew_Previews: PreviewProvider {
    static var previews: some View {
        AddProspectNew()
    }
}

struct FormInput: View {
    var title: String
    @Binding var text: String
    var body: some View {
        TextField(title, text: $text)
            .padding(10)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.main)
            }
            .padding(.horizontal, 3)
            .padding(.bottom, 5)
    }
}

struct AddProspectHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.badge.plus")
                .bold()
                .padding(10)
                .background {
                    Circle()
                        .stroke(lineWidth: 2)
                }
            Text("Create".uppercased())
                .font(.title)
            Text("Prospect".uppercased())
                .font(.title)
                .bold()
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .font(.title)
                    .bold()
            }
        }
        .foregroundColor(.main)
        .padding()
    }
}
