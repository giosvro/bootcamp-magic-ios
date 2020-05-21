//
//  TabBarController.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI(){
        
        tabBar.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).cgColor
        tabBar.layer.shadowOffset = CGSize(width: -4, height: 4)
        tabBar.layer.shadowOpacity = 0.4
        tabBar.layer.shadowRadius = 5
        let transperentBlackColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0)
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        transperentBlackColor.setFill()
        UIRectFill(rect)

        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            tabBar.backgroundImage = image
        }

        UIGraphicsEndImageContext()
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .gray
    }
    
    
}
