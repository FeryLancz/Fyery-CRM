//
//  FyeryModelFirebaseAuth.swift
//  Fyery
//
//  Created by Fery Lancz on 13.02.23.
//

import FirebaseAuth

extension FyeryModel {
    
    var signedIn: Bool { user != nil }
    
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
