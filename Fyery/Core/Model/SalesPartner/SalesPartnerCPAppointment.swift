//
//  SalesPartnerCPAppointment.swift
//  Fyery
//
//  Created by Fery Lancz on 29.01.23.
//

import Foundation

extension SalesPartner {
    var numberOfAppointmentsToday: Int {
        get {
            appointments.reduce(0) { sum, appointment in
                appointment.date.isToday() ? sum + 1 : sum
            }
        }
        set {
            
        }
        
    }
    
    var numberOfAppointmentsThisWeek : Int {
        get {
            appointments.reduce(0) { sum, appointment in
                appointment.date.isThisWeek() ? sum + 1 : sum
            }
        }
        set {
            
        }
        
    }
    
    var numberOfAppointmentsToClassify: Int {
        var count = 0
        for appointment in appointments where !appointment.isClassified && !appointment.isInFuture() {
            count += 1
        }
        return count
    }
}
