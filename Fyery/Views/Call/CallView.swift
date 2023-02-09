//
//  CallView.swift
//  Fyery
//
//  Created by Fery Lancz on 09.02.23.
//

import SwiftUI

struct CallView: View {
    @EnvironmentObject var user: SalesPartner
    @State var input = ""
    @State var addProspectShowing = false
    @State var callOutcomeShowing = false
    
    var numberName: String? {
        user.prospects.filter {
            $0.phoneNumber == input
        }
        .first?.fullName
    }
    
    var body: some View {
        VStack(spacing: 25) {
            Spacer()
            Title(input)
                .frame(minHeight: 50)
            Heading2(numberName ?? "")
            Button {
                input = ""
            } label: {
                Text("delete")
                    .foregroundColor(.secondary)
            }
            Spacer()
            CallPad(input: $input) {
                if input.count >= 5 {
                    Call.callNumber(input)
                    if numberName != nil {
                        callOutcomeShowing = true
                    } else {
                        addProspectShowing = true
                    }
                }
            }
            .padding(.bottom, 30)
        }
        .sheet(isPresented: $addProspectShowing) {
            AddProspectView(phoneNumber: input, presentedFromCallView: true)
        }
        .sheet(isPresented: $callOutcomeShowing) {
            CallOutcomeView(prospect: user.prospects.filter { $0.phoneNumber == input }.first!)
        }
    }
}

struct CallView_Previews: PreviewProvider {
    static var previews: some View {
        CallView()
            .environmentObject(SalesPartner())
    }
}
