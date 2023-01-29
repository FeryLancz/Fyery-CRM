//
//  SalesPartner.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import Foundation
import SwiftUI

class SalesPartner: Prospect {
    @Published var currentUnitsMonthly = 378.12
    @Published var goalUnitsMonthly = 500.0
    
    @Published var prospects:[Prospect] = []
    @Published var salesPartners: [SalesPartner] = []
    @Published var appointments: [Appointment] = []
}
