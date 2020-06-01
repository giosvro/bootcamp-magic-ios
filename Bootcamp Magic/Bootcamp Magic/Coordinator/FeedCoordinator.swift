//
//  FeedCoordinator.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FeedCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var rootViewController: UIViewController
    
    init() {
        self.rootViewController = FeedViewController()
    }
    
    func start() {
        
    }
    
    public func presentCardDetails(card: Card, cardImage: UIImage?) {
        let vc = CardDetailsViewController(card: card, cardImage: cardImage)
        vc.coordinator = self
        vc.modalPresentationStyle = .fullScreen
        self.rootViewController.present(vc, animated: true, completion: nil)
    }
}

extension FeedCoordinator: CoordinatorDelegate {
    func selectCard(card: Card, cardImage: UIImage?) {
//        Implementar o envio do card
        presentCardDetails(card: card, cardImage: cardImage)
    }
    
    
}
