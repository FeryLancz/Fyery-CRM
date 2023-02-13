//
//  FyeryModel.swift
//  Fyery
//
//  Created by Fery Lancz on 02.02.23.
//

import FirebaseAuth

class FyeryModel: ObservableObject {
    @Published var user: SalesPartner! = SalesPartner(generateTestData: true)
    
    var firebaseUser: User? {
        didSet { objectWillChange.send() }
    }
}
