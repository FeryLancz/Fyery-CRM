//
//  FyeryModelCall.swift
//  Fyery
//
//  Created by Fery Lancz on 13.02.23.
//

import SwiftUI

extension FyeryModel {
    func appScenePhaseChanged(to phase: ScenePhase) {
        
    }
    
    func callNumber(_ number: String, completionHandler completion: () -> Void) {
        let phoneNumberformatted = "tel://" + number.replacingOccurrences(of: " ", with: "")
        guard let url = URL(string: phoneNumberformatted) else { return }
        UIApplication.shared.open(url) { completion in
            print("call: \(completion)")
        }
    }
}
