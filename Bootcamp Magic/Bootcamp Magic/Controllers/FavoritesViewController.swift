//
//  FavoriteController.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    override func loadView() {
        let view = FavoritesView()
        view.delegate = self
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FavoritesViewController: ViewDelegate {
    func didButtonPressed() {
        print("nada rolando ainda")
    }
    
    
}
