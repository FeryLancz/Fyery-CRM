//
//  BlankInitializerExtensions.swift
//  Fyery
//
//  Created by Fery Lancz on 30.12.22.
//

import Foundation

extension Event {
    convenience init() {
        self.init(type: .callOnAppointment, title: "Call on Analysis", description: "Appointment scheduled")
    }
}

extension Appointment {
    convenience init() {
        self.init(type: .analysis, date: Date() + 60*60*24, participant: Prospect())
        self.concept = Concept(test: true)
    }
}

extension Prospect {
    convenience init() {
        self.init(type: .male, firstName: "Hans", lastName: "Peter", phoneNumber: "+4369981698213", contactor: nil, contactType: .colleague)
        
        self.job = "Programmer"
        self.approximateAge = 26
        self.childrenNote = "2 year old boy"
        self.maritalStatus = .married
        self.note = "old work colleague"
        
        self.email = "hans.peter@gmail.com"
        
        self.zip = 1030
        self.city = "Wien"
        self.street = "Rabengasse 6"
    }
}

extension Concept {
    convenience init(test: Bool) {
        self.init()
        let proposal1 = Proposal()
        proposal1.division = .kfz
        proposal1.prevCompany = .nö
        proposal1.prevPremium = 89.55
        proposal1.newCompany = .muki
        proposal1.newPremium = 55.40
        self.proposals.append(proposal1)
        let proposal2 = Proposal()
        proposal2.division = .rsv
        proposal2.prevCompany = .dbl
        proposal2.prevPremium = 22.50
        proposal2.newCompany = .arag
        proposal2.newPremium = 14.92
        self.proposals.append(proposal2)
        let proposal3 = Proposal()
        proposal3.division = .unf
        proposal3.prevCompany = .gen
        proposal3.prevPremium = 32.12
        proposal3.newCompany = .uqa
        proposal3.newPremium = 13.67
        self.proposals.append(proposal3)
        let proposal4 = Proposal()
        proposal4.type = .newContract
        proposal4.division = .flv
        proposal4.newCompany = .gen
        proposal4.newPremium = 50
        self.proposals.append(proposal4)
    }
}
