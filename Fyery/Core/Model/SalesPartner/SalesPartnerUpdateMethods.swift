//
//  SalesPartnerUpdateMethods.swift
//  Fyery
//
//  Created by Fery Lancz on 29.01.23.
//

import Foundation

extension SalesPartner {
    func updateAppointments() {
        let dummy = Appointment()
        self.appointments.append(dummy)
        self.appointments.removeAll {
            $0 === dummy
        }
    }
}
