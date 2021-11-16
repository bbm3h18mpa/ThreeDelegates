//
//  Kontakt.swift
//  ThreeDelegates
//
//  Created by Florian Panten / BBS2H20A BBM3H18M on 25.10.21.
//

class Kontakt {
    let name: String
    let alter: Int
    let geschlecht: Geschlecht
    
    init(name: String, alter: Int, geschlecht: Geschlecht) {
        self.name = name
        self.alter = alter
        self.geschlecht = geschlecht
    }
}

enum Geschlecht: String, CaseIterable {
    case MANN = "Mann"
    case FRAU = "Frau"
    case DIVERS = "Divers"
}
