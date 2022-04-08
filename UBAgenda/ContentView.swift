//
//  ContentView.swift
//  UBAgenda
//
//  Created by Aurélien on 17/03/2022.
//

import SwiftUI
import CodeScanner
import AVFoundation
import MXLCalendarManagerSwift


// Structure de la page d'acceuil
struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scannez un QR Code"
    
    
    // action lorsque le scan du qr code est effectuer
    var scannerSheet : some View {
        
    
               
            CodeScannerView(
                
                codeTypes: [.qr],
                completion: { result in
                    if case let .success(code) = result {
                        
                        self.scannedCode = code.string
                        self.isPresentingScanner = false
                        
                        //Creation de la table 
                        createTable()
                        createQR(code.string)

                        appState.hasOnboarded = true
                           
                    
                    }
                    
                }
            
            )
            
        }
        
        
        
    
    var body: some View {

            VStack(spacing: 10){
                
                //image
                Image("logoUb").padding()
        
                Spacer()
                
                
                //Bouton
                Button("Scannez un QR Code"){
                    
                    self.isPresentingScanner = true
                    
                }
                
                .padding()
                
                    .foregroundColor(.white)
                
                    .font(Font.headline.weight(.bold))
                
                    .background(Color(red: 238/255, green: 144/255, blue: 73/255))
                
                    .clipShape(Capsule())
                
                    .shadow(color: Color(red: 200/255, green: 108/255, blue: 39/255), radius: 1, x: 1, y: 1)
                    
                    
                
                    .sheet(isPresented: $isPresentingScanner){
                    
                        //Action lorsque que le boutton est pressé
                        self.scannerSheet
                    
                }
                Spacer()
            }
        
        

        
        
    }
    
    //Creation de la table dans la base de données local
    private func createTable(){
        let database = SQLiteBDD.sharedInstance
        database.create()
    }
    
    //Ajout du qr code dans la base de données
    private func createQR(_ qrCode:String){
        
        let qrCodeToTable = SQLiteCommande.insertData(qrCode: qrCode)
        
        
        
        
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
