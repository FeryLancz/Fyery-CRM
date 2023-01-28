//
//  AppointmentWidget.swift
//  Fyery
//
//  Created by Fery Lancz on 28.01.23.
//

import SwiftUI

struct AppointmentWidget: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Title2("Analysis:")
                Title2("Consultings:")
                Title2("Interviews:")
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 5) {
                Title2("3 / 9")
                Title2("5 / 7")
                Title2("2 / 3")
            }
        }
    }
}

struct AppointmentWidget_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentWidget()
    }
}
