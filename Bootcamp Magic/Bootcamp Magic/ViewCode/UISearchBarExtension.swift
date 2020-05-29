//
//  UISearchBarExtension.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 29/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

extension UISearchBar {
    
    func configureSearchBar(){
        self.placeholder = "Search for cards"
        self.backgroundImage = UIImage()
        self.showsCancelButton = true
        self.tintColor = .white
        let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .white
    }
}
