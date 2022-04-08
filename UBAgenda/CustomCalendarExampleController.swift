//
//  CustomCalendarExampleController.swift
//  UBAgenda
//
//  Created by Aurélien on 30/03/2022.
//

import CalendarKit
import UIKit
import EventKit
import SwiftUI

class CustomCalendarExampleController: DayViewController {

    private let eventStore = EKEventStore()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isToolbarHidden = false
        
        //Mise en place du boutton de suppression
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 21))
        button.center = CGPoint(x: 350, y: 690)
        button.setTitle("Supprimer", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.93, green: 0.56, blue: 0.29, alpha: 1.00)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.view.addSubview(button)

        

    }
    
    
    
    @IBAction func buttonTapped(_ sender: Any){
        //Suppression du qr code
        SQLiteCommande.deleteQrCode()
        //Fermeture de l'application
        exit(0)

    }
    
    
    //Fonction récuperant les évenements du qr code
    func getEvents() -> MXLCalendar?{
        
        
        let code: String = SQLiteCommande.readQR()!
        let url = URL(string: code)!
        let data = try! Data(contentsOf: url)
        
        guard let fileString = String(data: data, encoding: .utf8)else{print("Erreur lecture")
            return nil
        }
        
        print(fileString)
        let MXLCalendar = MXLCalendarManager()
        
        //Analyse du fichier récuperer
        let cals = MXLCalendar.parse(icsString: fileString)
        return cals

        
        
    }
    
    //Récuperation des évenelent de la selectionner
    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
        
        var dayComponent = DateComponents()
        dayComponent.day = 1
        
        let dateSelec = date
        
        
        let realDate: Date = calendar.date(byAdding: dayComponent, to: dateSelec)!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0
        
        
        
        )
        
        let convertDate: String = dateFormatter.string(from: realDate)
        
        let dateSub: Substring = convertDate.prefix(10)
        
        let finalDate: Date = dateFormatter.date(from: String(dateSub))!
        
        
        let models = RecupICal.coursDeLaDate(date: finalDate, lesCours: getEvents())

        
        var events = [Event]()
        
        for model in models.events {
            
            let event = Event()
            
            event.dateInterval = DateInterval(start: model.eventStartDate!, end: model.eventEndDate!)
            
            var description = model.eventDescription!.replacingOccurrences(of: "\\(.*\\)", with: "", options: .regularExpression)
            let removeN: Set<Character> = ["n"]
            description.removeAll(where: {removeN.contains($0)})
            
            
            
            
            event.text = "\(model.eventSummary!) \n \(model.eventLocation!) \n \(description)"
            //event.backgroundColor = UIColor(red: 0.93, green: 0.56, blue: 0.29, alpha: 1.00)
            event.color = UIColor(red: 0.93, green: 0.56, blue: 0.29, alpha: 1.00)
            event.textColor = .black
            
            
            events.append(event)
            
            
            
            
        }
        
        return events
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Home"
        
    }

      

    
    
    
}


