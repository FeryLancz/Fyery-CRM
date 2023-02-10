//
//  FyeryModel.swift
//  Fyery
//
//  Created by Fery Lancz on 02.02.23.
//

import Foundation
import Firebase

class FyeryModel: ObservableObject {
    @Published var user: SalesPartner?
    
    var firebaseUser: User? {
        didSet {
            objectWillChange.send()
        }
    }
    var signedIn: Bool {
        firebaseUser != nil
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
    }
    
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else {
                return
            }
            self.firebaseUser = user
        }
    }
}

enum LoginResult: String {
    case success
    case invalidCredentials
    case error
}