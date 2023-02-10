//
//  EventCellView.swift
//  Fyery
//
//  Created by Fery Lancz on 10.02.23.
//

import SwiftUI

struct EventCellView: View {
    @ObservedObject var event: Event
    var body: some View {
        NavigationLink(destination: EventDetailView(for: event)) {
            HStack {
                VStack(alignment: .leading) {
                    Text(event.description)
                    Text(event.title)
                        .font(.caption)
                }
                Spacer()
                Text(event.date.formatted())
            }
        }
    }
}

struct EventCellView_Previews: PreviewProvider {
    static var previews: some View {
        EventCellView(event: Event())
    }
}
