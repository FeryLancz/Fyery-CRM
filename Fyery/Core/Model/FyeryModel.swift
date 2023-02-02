//
//  FyeryModel.swift
//  Fyery
//
//  Created by Fery Lancz on 02.02.23.
//

import Foundation
import Firebase

class FyeryModel: ObservableObject {
    @Published var fuser: SalesPartner?
    
    var user: User? {
        didSet {
            objectWillChange.send()
        }
    }
    var signedIn: Bool {
        user != nil
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
            self.user = user
        }
    }
}

final class AuthenticationModel: ObservableObject {
    
    
}

enum LoginResult: String {
    case success
    case invalidCredentials
    case error
}
