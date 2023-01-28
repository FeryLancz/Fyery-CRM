//
//  DashboardGreetingView.swift
//  Fyery
//
//  Created by Fery Lancz on 14.01.23.
//

import SwiftUI

struct DashboardGreetingView: View {
    @ObservedObject var user: SalesPartner
    var greeting: String {
        switch Date().timeOfDay() {
        case .morning:
            return "Good Morning"
        case .afternoon:
            return "Hello"
        case .evening:
            return "Good Evening"
        case .night:
            return "Good Night"
        }
    }
    
    var body: some View {
        HStack {
            Title("\(greeting), \(user.firstName)")
            Image(systemName: "hand.wave")
                .title()
        }
    }
}

struct DashboardGreetingView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardGreetingView(user: SalesPartner(generateTestData: true))
            .previewLayout(.sizeThatFits)
    }
}
