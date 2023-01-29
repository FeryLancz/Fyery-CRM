//
//  DashboardGreetingView.swift
//  Fyery
//
//  Created by Fery Lancz on 14.01.23.
//

import SwiftUI

struct DashboardGreetingView: View {
    @Binding var name: String
    @State var greeting = Greeting.appropriate()
    
    var body: some View {
        HStack {
            Title("\(greeting), \(name)")
            Image(systemName: "hand.wave")
                .title()
        }
        .onAppear {
            greeting = Greeting.appropriate()
        }
    }
}

struct DashboardGreetingView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardGreetingView(name: .constant("Fery"))
            .previewLayout(.sizeThatFits)
    }
}
