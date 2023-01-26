//
//  ProspectListRowView.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import SwiftUI

struct ProspectListRowView: View {
    @ObservedObject var prospect: Prospect
    
    init(_ prospect: Prospect) { self.prospect = prospect }
    
    var body: some View {
        PrimarySection(spacing: 2) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack(spacing: 5) {
                        Text(prospect.firstName)
                        Text(prospect.lastName)
                            .bold()
                        Spacer()
                        Text(prospect.contactType.rawValue + " | " + prospect.contectorFullName)
                            .font(.footnote)
                    }
                    .font(.title3)
                    .foregroundColor(.main)
                    
                    Text(prospect.lastContact.formatted(date: .complete, time: .omitted))
                        .font(.footnote)
                }
                Spacer()
                Image(systemName: "chevron.forward")
            }
            
        }
        
    }
}

struct ProspectListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectListRowView(Prospect())
            .previewLayout(.sizeThatFits)
    }
}
