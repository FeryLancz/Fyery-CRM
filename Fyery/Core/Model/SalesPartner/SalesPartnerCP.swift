//
//  SalesPartnerComputedProperties.swift
//  Fyery
//
//  Created by Fery Lancz on 29.01.23.
//

import Foundation

extension SalesPartner {
    var clients: [Prospect] { prospects.filter { $0.isCustomer } }
    
    
    
    var numberOfConceptsToPrepare: Int {
        var count = 0
        for concept in appointments.compactMap({ $0.concept }) where concept.state == .created {
            count += 1
        }
        return count
    }
   
    var allConcepts: [Concept] {
        appointments.compactMap { $0.concept }
    }
    
    var unitsProgress: Double {
        set { }
        get {
            currentUnitsMonthly / goalUnitsMonthly
        }
    }

    func addAppointment(_ appointment: Appointment) {
        appointments.append(appointment)
        appointments.sort(by: {
            $0.date > $1.date
        })
    }
    
    func getConcepts(for person: Person) -> [Concept] {
        var concepts: [Concept] = []
        for appointment in self.appointments where appointment.participant === person && appointment.concept != nil {
            concepts.append(appointment.concept!)
        }
        return concepts
    }
    
    func getAppointment(for concept: Concept) -> Appointment {
        for appointment in appointments where appointment.concept === concept {
            return appointment
        }
        return Appointment()
    }
    
    func findPerson(_ person: Person) -> Person? {
        self.prospects.first(where: { $0 === person })
    }
    
    func closeConsulting(for probablePerson: Person, in appointment: Appointment) {
        guard let concept = appointment.concept else { return }
        guard let person = findPerson(probablePerson) else { return }
        for proposal in concept.proposals { proposal.selection = proposal.preSelection }
        if concept.proposals.reduce(0, { $0 + ($1.selection ? 1 : 0) }) > 1 {
            let newEvent = Event(type: .appointmentPerformed, title: "Became Customer after Consulting", description: "")
            appointment.addEvent(newEvent)
            person.isCustomer = true
        }
        
        //TODO: Add additional setup for tracking of new Contracts and sending of Cancellations
    }
}
