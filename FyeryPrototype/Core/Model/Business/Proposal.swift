//
//  Proposal.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 31.12.22.
//

import Foundation

class Proposal: ObservableObject, Identifiable {
    @Published var division: ContractDivision = .notSelected
    @Published var type: ProposalType = .change
    
    @Published var prevCompany: Company = .notSelected
    @Published var prevPremium: Double = 0.0
    @Published var newCompany: Company = .notSelected
    @Published var newPremium: Double = 0.0
    
    @Published var preSelection = true
    @Published var selection = true
}

enum ContractDivision: String, CaseIterable {
    case notSelected = "Sparte wählen"
    case bsp =  "Bausparvertrag"
    case bu = "Berufsunfähigkeitsversicherung"
    case flv = "Fondsgebundene Lebensversicherung"
    case fonds = "Fonds"
    case geld = "Kredit"
    case haf = "Privathaftpflicht"
    case kfz = "KFZ - Versicherung"
    case kv = "Krankenversicherung"
    case lv = "Lebensversicherung"
    case pp = "Prämienpension"
    case rsv = "Rechtsschutz"
    case sach = "Haushalt / Eigenheim"
    case unf = "Unfallversicherung"
    case other = "Sonstiges"
}

enum ProposalType: String, CaseIterable {
    case change = "Change"
    case newContract = "New Contract"
    case cancellation = "Cancellation"
}

enum Company: String, CaseIterable {
    case notSelected = "Gesellschaft wählen"
    case ali = "Allianz"
    case anadi = "Anadi Bank"
    case arag = "Arag"
    case bank99 = "Bank 99 AG"
    case bat = "Bank Austria"
    case baw = "Bawag"
    case bitp = "Bitpanda GmbH"
    case bks = "BKS Bank AG"
    case bnp = "BNP Paribas"
    case cap = "Capital Bank"
    case coin = "Coinbase"
    case cont = "Continentale"
    case das = "D.A.S. Rechtsschutz"
    case deniz = "Deniz Bank"
    case dia = "Dialog"
    case dbl = "Donau"
    case vivo = "ERGO Versicherung"
    case eb = "Easybank"
    case ehc = "Eroherc Versicherung AG"
    case er = "Europäische Reiseversicherung"
    case flat = "flatex AT"
    case ska = "Forward You (Skandia)"
    case gar = "Garanta"
    case gen = "Generali"
    case genb = "Generali Bank"
    case goth = "Gothaer"
    case grw = "Grazer Wechselseitige"
    case hdi = "HDI"
    case hdil = "HDI Lebensversicherung AG"
    case heil = "Heidelberger Leben (Clerical Medical)"
    case hel = "Helvetia"
    case helb = "Hello bank"
    case hyoö = "Hypo Oberösterreich"
    case hyp = "Hypo Alpe-Adria"
    case jan = "Janitos"
    case klv = "Kärntner Landesversicherung"
    case mer = "Merkur"
    case muki = "Muki"
    case nex = "nexible GmbH"
    case nö = "Niederösterreichische"
    case nüv = "Nürnberger"
    case obb = "Oberbank"
    case oö = "Oberösterreichische"
    case öbv = "ÖBV"
    case öhv = "Österreichische Hagelversicherung"
    case por = "Porsche Versicherung"
    case pri = "PrismaLife"
    case ruv = "R+V Versicherung"
    case raia = "Raiffeisenbank"
    case rais = "Raiffeisen Versicherung"
    case rrs = "Roland"
    case scb = "Santander"
    case spk = "Sparkasse"
    case sv = "S-Versicherung"
    case skv = "SK-Versicherung"
    case slv = "Standard Life Versicherung"
    case slh = "Swiss Life"
    case tir = "Tiroler"
    case uqa = "Uniqa"
    case vav = "VAV"
    case vl = "Vienna-Life"
    case vow = "Volksbank"
    case ws = "Wiener Städtische"
    case wv = "Wiener Verein"
    case wüt = "Wüstenrot Versicherung"
    case wwk = "WWK"
    case you = "YOUPLUS Assurance AG"
    case zür = "Zürich"
    case other = "Sonstiges"
}
