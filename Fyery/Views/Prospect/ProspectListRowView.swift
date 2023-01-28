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
                ZStack {
                    Text(prospect.initials)
                        //.font(.title3)
                        .bold()
                    StandardCircle()
                }
                .foregroundColor(.main)
                VStack(alignment: .leading, spacing: 5) {
                    HStack(spacing: 5) {
                        Text(prospect.firstName)
                        Text(prospect.lastName)
                            .bold()
                        Spacer()
                    }
                    .font(.body)
                    .foregroundColor(.main)
                    
                    Text(prospect.lastContact.formatted(date: .complete, time: .omitted))
                        .font(.footnote)
                        .foregroundColor(.utility)
                }
                Spacer()
                Image(systemName: "chevron.forward")
                    .foregroundColor(.action)
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
