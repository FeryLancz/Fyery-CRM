//
//  UserTestData.swift
//  Fyery
//
//  Created by Fery Lancz on 27.12.22.
//

import Foundation

extension SalesPartner {
    convenience init(generateTestData: Bool) {
        self.init(type: .male, firstName: "Fery", lastName: "Lancz", phoneNumber: "+43 660 4463239")
        if generateTestData {
            let melina = Prospect(type: .female, firstName: "Melina", lastName: "Winter", phoneNumber: "+43 4024 9789", contactor: nil, contactType: .colleague)
            let max = Prospect(type: .male, firstName: "Max", lastName: "Lang", phoneNumber: "+43 9301 386419", contactor: melina, contactType: .colleague)
            let elina = Prospect(type: .female, firstName: "Elina", lastName: "Reiter", phoneNumber: "0664 5496354", contactor: melina, contactType: .colleague)
            let maria = Prospect(type: .female, firstName: "Maria", lastName: "Brunner", phoneNumber: "0660 9877600", contactor: max, contactType: .colleague)
            let jana = Prospect(type: .female, firstName: "Jana", lastName: "Riegler", phoneNumber: "0660 8099493", contactor: elina, contactType: .colleague)
            let carsten = Prospect(type: .female, firstName: "Carsten", lastName: "Müller", phoneNumber: "069981698213", contactor: elina, contactType: .colleague)
            jana.isCustomer = true
            
            carsten.zip = 1030
            carsten.city = "Wien"
            carsten.street = "Rabengasse 6"
            
            carsten.job = "Programmer"
            carsten.approximateAge = 26
            carsten.childrenNote = "2 year old boy"
            carsten.maritalStatus = .married
            carsten.note = "old work colleague"
            
            carsten.email = "carsten.mueller@gmail.com"
            
            self.addProspect(melina)
            self.addProspect(max)
            self.addProspect(elina)
            self.addProspect(maria)
            self.addProspect(jana)
            self.addProspect(carsten)
            
            
            let testAppointments = [
                Appointment(type: .analysis, date: Date()-86400, participant: melina),
                Appointment(type: .consulting, date: Date()+239101, participant: max)
            ]
            self.appointments += testAppointments
            self.appointments[1].concept = Concept(test: true)
        }
    }
}
