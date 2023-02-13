//
//  CallView.swift
//  Fyery
//
//  Created by Fery Lancz on 09.02.23.
//

import SwiftUI

struct CallView: View {
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.isPresented) var isPresented
    @EnvironmentObject var model: FyeryModel
    
    
    
    @Binding var tabSelection: Int
    @State var input = ""
    @State var addProspectShowing = false
    @State var callOutcomeShowing = false
    @State var callPressed = false
    
    @State private var lastPhases: [ScenePhase] = []
    private let pattern: [ScenePhase] = [.active, .inactive, .active, .inactive, .background, .inactive, .active]
    
    var numberName: String? {
        model.user.prospects.filter {
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
                    callPressed = true
                    Phone.callNumber(input)
                }
            }
            .padding(.bottom, 30)
        }
        .sheet(isPresented: $addProspectShowing) {
            AddProspectView(phoneNumber: input, presentedFromCallView: true)
        }
        .sheet(isPresented: $callOutcomeShowing) {
            CallOutcomeView(prospect: model.user.prospects.filter { $0.phoneNumber == input }.first!)
        }
        .onChange(of: scenePhase) { newPhase in
            //print(newPhase)
            if callPressed {
                
                lastPhases.append(newPhase)
                let toMatch = Array(lastPhases.suffix(pattern.count))
                if toMatch == pattern && tabSelection == 2 {
                    callPressed.toggle()
                    lastPhases = []
                    if numberName != nil {
                        callOutcomeShowing = true
                    } else {
                        addProspectShowing = true
                    }
                }
            }
        }
        .onAppear {
            print("on Appear")
        }
        .onDisappear {
            print("on Disappear")
        }
        .onChange(of: isPresented) { newVar in
            print(newVar)
        }
    }
}

struct CallView_Previews: PreviewProvider {
    static var previews: some View {
        CallView(tabSelection: .constant(2))
            .environmentObject(FyeryModel())
    }
}
