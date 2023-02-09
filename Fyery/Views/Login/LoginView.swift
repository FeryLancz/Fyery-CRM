//
//  LoginView.swift
//  Fyery
//
//  Created by Fery Lancz on 01.02.23.
//

import SwiftUI
import LocalAuthentication

struct LoginView: View {
    @ObservedObject var model: FyeryModel
    @State var email = ""
    @State var password = ""
    
    @State private var isUnlocked = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            
            Title("FYERY")
            TextField(
                "Email Address",
                text: $email
            )
            .textContentType(.emailAddress)
            .textInputAutocapitalization(.never)
            .keyboardType(.emailAddress)
            .autocorrectionDisabled()
            .padding()
            .background(Color.main.opacity(0.2))
            .clipShape(Capsule())
            
            SecureField(
                "Password",
                text: $password
            )
            .textContentType(.password)
            .textInputAutocapitalization(.never)
            .padding()
            .background(Color.main.opacity(0.2))
            .clipShape(Capsule())
            Button {
                model.signIn(email: email, password: password)
            } label: {
                Heading3("Login")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        Color.main.opacity(0.3)
                    }
                    .clipShape(Capsule())
                    .padding(.top, 30)
            }
            Button {
                authenticate()
            } label: {
                Heading3("Login with Face ID")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        Color.main.opacity(0.3)
                    }
                    .clipShape(Capsule())
                    .padding(.top, 30)
            }
            Spacer()
        }
        .padding(15)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    model.signIn(email: "fery.lancz@efs-ag.at", password: "140697")
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(model: FyeryModel())
    }
}
