//
//  CardDetailsViewController.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 22/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class CardDetailsViewController: UIViewController {

    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = CardDetailsView()
        view.delegate = self
        self.view = view

    }

}

extension CardDetailsViewController: ViewDelegate {
    
    func didButtonPressed() {
        
    }
    
}
