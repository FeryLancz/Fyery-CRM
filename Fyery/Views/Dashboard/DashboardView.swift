//
//  DashboardView.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var user: SalesPartner
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                HStack {
                    DashboardGreetingView(user: user)
                    Spacer()
                }
                UnitsWidget(user: user)
                DashboardListItem(title: "Appointments", badge: user.numberOfAppointmentsToClassify, destination: AnyView(AppointmentsView()))
                DashboardListItem(title: "Concepts to Prepare", badge: user.numberOfConceptsToPrepare, destination: AnyView(ConceptsView()))
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Dashboard".uppercased())
                        .fontWeight(.heavy)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { } label: {
                        Image(systemName: "phone")
                            .foregroundColor(.black)
                    }
                }
            }
            .applyBackground()
        }
    }
}

struct DashboardListItem: View {
    var title: String
    var badge: Int
    var destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Text(title)
                Spacer()
                Text(String(badge))
            }
        }
    }
}

struct CircularProgressBar: View {
    @Binding var progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, style: StrokeStyle(lineWidth: 10))
                .frame(width: 75, height: 75)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .frame(width: 75, height: 75)
                .rotationEffect(Angle(degrees: 270.0))
            Text(String(format: "%.1f", progress * 100) + "%")
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .environmentObject(SalesPartner(generateTestData: true))
    }
}
