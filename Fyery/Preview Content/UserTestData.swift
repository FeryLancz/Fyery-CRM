//
//  UserTestData.swift
//  Fyery
//
//  Created by Fery Lancz on 27.12.22.
//

import Foundation

extension SalesPartner {
    convenience init(generateTestData: Bool) {
        self.init(type: .male, firstName: "Fery", lastName: "Lancz", phoneNumber: "+43 660 4463239", contactor: nil, contactType: .relative, advisor: nil)
        if generateTestData {
            let melina = Prospect(type: .female, firstName: "Melina", lastName: "Winter", phoneNumber: "+43 4024 9789", contactor: self, contactType: .colleague, advisor: self)
            let max = Prospect(type: .male, firstName: "Max", lastName: "Lang", phoneNumber: "+43 9301 3864-19", contactor: melina, contactType: .colleague, advisor: self)
            let elina = Prospect(type: .female, firstName: "Elina", lastName: "Reiter", phoneNumber: "0664 5496354", contactor: melina, contactType: .colleague, advisor: self)
            let maria = Prospect(type: .female, firstName: "Maria", lastName: "Brunner", phoneNumber: "0660 9877600", contactor: max, contactType: .colleague, advisor: self)
            let jana = Prospect(type: .female, firstName: "Jana", lastName: "Riegler", phoneNumber: "0660 8099493", contactor: elina, contactType: .colleague, advisor: self)
            jana.isCustomer = true
            
            self.addProspect(melina)
            self.addProspect(max)
            self.addProspect(elina)
            self.addProspect(maria)
            self.addProspect(jana)
            
            
            let testAppointments = [
                Appointment(type: .analysis, date: Date()-86400, participant: melina),
                Appointment(type: .consulting, date: Date()+239101, participant: max),
                Appointment(type: .interview, date: Date()+120842, participant: jana),
            ]
            self.appointments += testAppointments
            self.appointments[1].concept = Concept(test: true)
        }
    }
}
