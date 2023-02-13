//
//  ContentView.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = FyeryModel()
    
    var body: some View {
        Group {
            if model.firebaseUser == nil  {
                LoginView(model: model)
            } else {
                MainTabView(model: model)
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
