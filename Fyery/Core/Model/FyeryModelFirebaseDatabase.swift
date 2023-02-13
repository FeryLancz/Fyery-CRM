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
        guard let databasePath = databasePath else {
            return
        }
        if user == nil {
            return
        }
        //let thought = ThoughtModel(text: newThoughtText)
        do {
            let data = try JSONEncoder().encode(user)
            let json = try JSONSerialization.jsonObject(with: data)
            databasePath.child(String(user.id))
                .setValue(json)
        } catch {
            print("an error occurred", error)
        }
    }
    
    //    func listenForThoughts() {
    //        guard let databasePath = databasePath else {
    //            return
    //        }
    //        databasePath
    //            .observe(.childAdded) { [weak self] snapshot in
    //                guard
    //                    let self = self,
    //                    var json = snapshot.value as? [String: Any]
    //                else {
    //                    return
    //                }
    //                json["id"] = snapshot.key
    //                do {
    //                    let thoughtData = try JSONSerialization.data(withJSONObject: json)
    //                    let thought = try self.decoder.decode(ThoughtModel.self, from: thoughtData)
    //                    self.thoughts.append(thought)
    //                } catch {
    //                    print("an error occurred", error)
    //                }
    //            }
    //    }
}
