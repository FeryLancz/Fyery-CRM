//
//  FyeryApp.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

@main
struct FyeryApp: App {
    @StateObject var user = SalesPartner(generateTestData: true)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(user)
        }
    }
}
