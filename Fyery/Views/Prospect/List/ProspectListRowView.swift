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
        PrimarySection(verticalSpacing: 2) {
            HStack {
                ZStack {
                    NormalText(prospect.initials)
                        .bold()
                    StandardCircle()
                }
                VStack(alignment: .leading, spacing: 3) {
                    HStack(spacing: 5) {
                        NormalText(prospect.firstName)
                        NormalText(prospect.lastName)
                            .bold()
                        Spacer()
                    }
                    .font(.body)
                    .foregroundColor(.main)
                    Subtext(prospect.lastContact.formatted(date: .complete, time: .omitted))
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
