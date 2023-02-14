//
//  ContentView.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: FyeryModel
    
    var body: some View {
        Group {
            if model.firebaseUser == nil  {
                LoginView()
            } else {
                MainTabView()
            }
        }
        .onAppear {
            model.listenToAuthState()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FyeryModel())
    }
}
