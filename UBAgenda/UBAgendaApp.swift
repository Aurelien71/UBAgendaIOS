//
//  UBAgendaApp.swift
//  UBAgenda
//
//  Created by Aurélien on 17/03/2022.
//

import SwiftUI

class AppState: ObservableObject{
    @Published var hasOnboarded: Bool
    
    init(hasOnboarded: Bool){
        
        self.hasOnboarded = hasOnboarded
        print("Etat 1 : \(self.hasOnboarded)")
        if SQLiteCommande.readQR()! != "" {
            
            self.hasOnboarded = true
            print("Trouver")
        
            
            
        } else {
            
            self.hasOnboarded = false
            print("Vide")
            
        }

    }
}




@main
struct UBAgendaApp: App {
    @ObservedObject var appState = AppState(hasOnboarded: false)

    var body: some Scene {
        WindowGroup {
            
            if appState.hasOnboarded{
                
                ADESemaineView()
                    .environmentObject(appState)
                
 
            } else {
                ContentView()
                    .environmentObject(appState)
            }
            
        }
    }
}
