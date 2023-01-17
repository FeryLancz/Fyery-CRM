//
//  FyeryPrototypeApp.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

@main
struct FyeryPrototypeApp: App {
    @StateObject var user = SalesPartner(generateTestData: true)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(user)
        }
    }
}
