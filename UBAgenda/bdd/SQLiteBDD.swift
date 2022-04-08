//
//  initBDD.swift
//  UBAgenda
//
//  Created by Aurélien on 31/03/2022.
//

import Foundation
import SQLite

class SQLiteBDD {
    static let sharedInstance = SQLiteBDD()
    var database: Connection?
    
    private init(){
        
        do{
            
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("qrCode").appendingPathExtension("sqlite3")
            database = try Connection(fileUrl.path)
            
        } catch {
            
            print("Erreur de création de la base de données : \(error)")
            
        }
        
    }
    
    func create(){
         
        SQLiteCommande.createTable()
        
    }
   
}
