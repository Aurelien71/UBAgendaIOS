//
//  TabbarController.swift
//  UBAgenda
//
//  Created by Aurélien on 04/04/2022.
//

import UIKit

class TabbarController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delete = CustomCalendarExampleController()
        
        delete.title = "Changer QRCode"
        
        delete.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: delete)
        
        nav1.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1], animated: true)
        
        
    }
    
    
    
    
}
