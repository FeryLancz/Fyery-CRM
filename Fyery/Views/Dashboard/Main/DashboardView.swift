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
                DashboardGreetingView(name: $user.firstName)
                    .customAlign(.leading)
                    .padding(.horizontal, 15)
                    .padding(.top, 15)
                Subtitle("Have a great day!")
                    .customAlign(.leading)
                    .padding(.horizontal, 15)
                AppointmentMenuItemView(appointmentsToday: $user.numberOfAppointmentsToday, appointmentsThisWeek: $user.numberOfAppointmentsThisWeek)
            }
            .refreshable {
                updateMenuItems()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    PrimaryHeader(title: "Dashboard", logoSystemName: "display")
                }
            }
            .applyBackground()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func updateMenuItems() {
        user.updateAppointments()
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .environmentObject(SalesPartner(generateTestData: true))
    }
}
