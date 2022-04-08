//
//  RecupICal.swift
//  UBAgenda
//
//  Created by Aurélien on 01/04/2022.
//

import Foundation

public class RecupICal {
    
    
    
    //Récupère tout les cours de la date sélectionner
    static func coursDeLaDate(date: Date, lesCours: MXLCalendar?) -> MXLCalendar {
        
        let lesCoursDeLaDate = MXLCalendar()
        let lesCoursZ: MXLCalendar = lesCours!

        
        
        
        for cours in lesCoursZ.events {

            
            let order = Calendar.current.compare(date, to: cours.eventStartDate!, toGranularity: .day)
            
            if(order == .orderedSame){
                
                lesCoursDeLaDate.add(event: cours)
                
            }
            
        }
        return lesCoursDeLaDate
        
        
        
        
        
    }
    
    
    
    
    
}
