//
//  FyeryModel.swift
//  Fyery
//
//  Created by Fery Lancz on 02.02.23.
//

import SwiftUI
import FirebaseAuth

class FyeryModel: ObservableObject {
    @Published var user: SalesPartner! = SalesPartner(generateTestData: true)
    
    @Published var callDebugMode = true
    
    var firebaseUser: User? {
        didSet { objectWillChange.send() }
    }
    
    // MARK: - Call Detection Logic
    private var callStarted = false
    private var lastPhase: ScenePhase = .background
    private var dateOfCallAction: Date = Date()
    private var callAction: (() -> Void)? = nil
    
    func appScenePhaseChanged(to newPhase: ScenePhase) {
        if self.callStarted {
            if self.lastPhase == .inactive && newPhase == .active {
                self.dateOfCallAction = Date()
            }
            else if self.lastPhase == .inactive && newPhase == .background {
                let timeDifference = Date().timeIntervalSince(dateOfCallAction) * 1000
                self.callStarted = false
                print(timeDifference)
                if timeDifference < 1000 {
                    if let action = self.callAction { action() }
                    self.callAction = nil
                }
            }
        }
        lastPhase = newPhase
    }
    
    func callNumber(_ number: String, completionHandler completion: @escaping () -> Void) {
        let phoneNumberformatted = "tel://" + number.replacingOccurrences(of: " ", with: "")
        guard let url = URL(string: phoneNumberformatted) else { return }
        if !self.callDebugMode {
            UIApplication.shared.open(url) { _ in
                self.callStarted = true
                self.callAction = completion
            }
        } else {
            completion()
        }
    }
}
