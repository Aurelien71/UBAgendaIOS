//
//  Cours.swift
//  UBAgenda
//
//  Created by Aurélien on 29/03/2022.
//

import Foundation

public class Cours{
    
    var dateDebut: String
    var dateFin: String
    var heureDebut: String
    var heureFin: String
    var matiere: String
    var location: String
    var description: String
    
    
    
    public init(dateDebut: String, dateFin: String, heureDebut: String, heureFin: String, matiere: String, location: String, description: String) {
        self.dateDebut = dateDebut
        self.dateFin = dateFin
        self.heureDebut = heureDebut
        self.heureFin = heureFin
        self.matiere = matiere
        self.location = location
        self.description = description
        
        
    }
    
    

    
    
    
    
    
    
}
