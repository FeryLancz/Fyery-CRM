//
//  UnitWidget.swift
//  Fyery
//
//  Created by Fery Lancz on 27.01.23.
//

import SwiftUI

struct UnitWidget: View {
    @EnvironmentObject var user: SalesPartner
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Title2("Current Unit Progress")
                Title2("33% completed")
                Title2("267 EH to go")
            }
            Spacer()
            CircularProgressBar(progress: .constant(0.3))
                .frame(maxHeight: 100)
        }
        
    }
}

struct UnitWidget_Previews: PreviewProvider {
    static var previews: some View {
        UnitWidget()
            .previewLayout(.sizeThatFits)
    }
}
