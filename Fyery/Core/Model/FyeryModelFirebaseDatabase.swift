//
//  FyeryModelFirebaseDatabase.swift
//  Fyery
//
//  Created by Fery Lancz on 13.02.23.
//

import FirebaseAuth
import FirebaseDatabase

extension FyeryModel {
    private var databasePath: DatabaseReference? {
        guard let uid = Auth.auth().currentUser?.uid else {
            return nil
        }
        let ref = Database.database()
            .reference()
            .child("users/\(uid)")
        return ref
    }
    
    
    func stopListening() {
        databasePath?.removeAllObservers()
    }
    
    func postThought() {
        guard let databasePath = databasePath else { return }
        if user == nil { return }
        do {
            let data = try JSONEncoder().encode(user)
            let json = try JSONSerialization.jsonObject(with: data)
            databasePath.child(String(user.id))
                .setValue(json)
        } catch {
            print("Error:", error)
        }
    }
}
