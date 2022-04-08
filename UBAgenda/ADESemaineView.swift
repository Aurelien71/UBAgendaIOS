//
//  ADESemaineView.swift
//  UBAgenda
//
//  Created by Aurélien on 30/03/2022.
//

import SwiftUI
import CalendarKit

struct ADESemaineView: UIViewControllerRepresentable {
    @EnvironmentObject var appState: AppState
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }

    
    func makeUIViewController(context: Context) -> some UIViewController {
        //On lance la vue CustomCalendarExampleController
        let dayViewController = CustomCalendarExampleController()
        return dayViewController
    }

}

struct ADESemaineView_Previews: PreviewProvider {
    static var previews: some View {
        
        ADESemaineView()
    }
}
