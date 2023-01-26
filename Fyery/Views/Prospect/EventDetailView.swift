//
//  EventDetailView.swift
//  Fyery
//
//  Created by Fery Lancz on 28.12.22.
//

import SwiftUI

struct EventDetailView: View {
    @ObservedObject var event: Event
    
    init(for event: Event) { self.event = event }
    
    var body: some View {
        List {
            SplitTextView("Title:", event.title)
            SplitTextView("Desciption:", event.description)
            SplitTextView("Date:", event.date.formatted())
        }
        .navigationTitle(event.title)
        .navigationBarTitleDisplayMode(.large)
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EventDetailView(for: Event())
        }
    }
}
