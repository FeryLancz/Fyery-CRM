//
//  WidgetContainer.swift
//  Fyery
//
//  Created by Fery Lancz on 27.01.23.
//

import SwiftUI

struct WidgetContainer: View {
    @State var selectedTab = 0
    var body: some View {
        
            TabView(selection: $selectedTab) {
                PrimarySection {
                    UnitWidget()
                }
                PrimarySection {
                    AppointmentWidget()
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
        
    }
}

struct WidgetContainer_Previews: PreviewProvider {
    static var previews: some View {
        WidgetContainer()
            .previewLayout(.sizeThatFits)
    }
}
