//
//  SQLiteCommande.swift
//  UBAgenda
//
//  Created by Aurélien on 31/03/2022.
//

import Foundation
import SQLite
import SQLite3
import SwiftUI

class SQLiteCommande {
    
    static var table = Table("QRCode")
    
    static let id = Expression<Int>("id")
    static let url = Expression<String>("url")
    
    static func createTable(){
        guard let database = SQLiteBDD.sharedInstance.database else{
            print("Datastore connection error")
            return
        }
        
        do{
            try database.run(table.create(ifNotExists: true){ table in
                table.column(id, primaryKey: true)
                table.column(url)
                
            })}catch{
                
                
                print("La table existe déjâ : \(error)")
                
            }
        
        
            
            
            
        }
    
    
    static func insertData(qrCode: String) -> Bool? {
        
        guard let database = SQLiteBDD.sharedInstance.database else{
            
            print("Connexion echoué")
            return nil
            
        }
        
        do{
            try database.run(table.insert(url <- qrCode))
            return true

        } catch let Result.error(message, code, statement) where code == SQLITE_CONSTRAINT{
            
            print("Insertion erreur : \(message), in \(String(describing: statement))")
            return false
 
        } catch let error {
            print("Insertion erreur: \(error)")
            return false
            
        }
        
        
        
    }
    
    static func readQR() -> String? {
        
        
        guard let database = SQLiteBDD.sharedInstance.database else {
            
            print("Connexion échoué")
            return nil
            
        }
        
        var resultat = ""
        
        table = table.order(id.desc)
        
        do{
            for qrCode in try database.prepare(table){
                let result = qrCode[url]
                resultat = result
                print("Resultat \(result)")
                
                
            }
            
            
        } catch {
            
            print("Erreur lecture : \(error)")
            
        }
        
        return resultat
        
    }
    
    
    static func deleteQrCode(){
        
        guard let database = SQLiteBDD.sharedInstance.database else{
            print("Datastore connection error")
            return
        }
        
        do{
            try database.execute("DELETE FROM QRCode")
            
            print("Suppression réussi !")
            
            
        } catch {
            
            print("Erreur supression : \(error)")
            
        }

    }
        
    }
    
    
    

