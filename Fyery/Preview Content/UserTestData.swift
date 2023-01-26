//
//  UserTestData.swift
//  Fyery
//
//  Created by Fery Lancz on 27.12.22.
//

import Foundation

extension SalesPartner {
    convenience init(generateTestData: Bool) {
        self.init()
        if generateTestData {
            let testProspects = [
                Prospect(type: .female, firstName: "Melina", lastName: "Winter", phoneNumber: "+43 4024 9789", contactor: nil, contactType: .colleague),
                Prospect(type: .male, firstName: "Max", lastName: "Lang", phoneNumber: "+43 9301 3864-19", contactor: nil, contactType: .colleague),
                Prospect(type: .female, firstName: "Elina", lastName: "Reiter", phoneNumber: "0664 5496354", contactor: nil, contactType: .colleague),
                Prospect(type: .female, firstName: "Maria", lastName: "Brunner", phoneNumber: "0660 9877600", contactor: nil, contactType: .colleague),
                Prospect(type: .female, firstName: "Jana", lastName: "Riegler", phoneNumber: "0660 8099493", contactor: nil, contactType: .colleague)
            ]
            self.prospects += testProspects
            self.prospects[4].isCustomer = true
            
            let testAppointments = [
                Appointment(type: .analysis, date: Date()-86400, participant: testProspects[0]),
                Appointment(type: .consulting, date: Date()+239101, participant: testProspects[1]),
                Appointment(type: .interview, date: Date()+120842, participant: testProspects[2]),
            ]
            self.appointments += testAppointments
            self.appointments[1].concept = Concept(test: true)
        }
    }
}
