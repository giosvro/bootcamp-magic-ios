//
//  FavoritesCoordinator.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FavoritesCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var rootViewController: UIViewController
    
    init() {
        self.rootViewController = FavoritesViewController()
    }
    
    func start() {
        
    }
    
    public func presentCardDetails(card: Card, cardImage: UIImage) {
        let vc = CardDetailsViewController(card: card, cardImage: cardImage)
        vc.coordinator = self
        self.rootViewController.present(vc, animated: true, completion: nil)
    }
}
