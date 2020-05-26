//
//  FeedViewModel.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 25/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FeedViewModel {
    var delegate: ViewDelegate?
    var arrayCards: [Card]?
    var typesCards: [String]?
    var networkManager = NetworkManager()
    var coordinatorDelegate: CoordinatorDelegate?
    
    public func loadCards(){
        requestTypes()
    }
    
    private func requestTypes(){
        networkManager.getAllTypes { (types, error) in
            guard let types = types else { return }
            self.typesCards = types
            DispatchQueue.main.async {
                types.forEach({ (type) in
                    print(type)
                })
                self.requestCards()
            }
            
        }
    }
    
    private func requestCards(){
        guard let type = typesCards?.first else { return }
        networkManager.getAllCards(page: 1, set: "KTK", type: type) { (cards, error) in
            guard let cards = cards else { return }
            self.arrayCards = cards
            cards.forEach({ (card) in
                print(card)
            })
            self.reloadCollection()
        }
    }
    
    func showCard(card: Card) {
        coordinatorDelegate?.selectCard(card: card)
    }
    
    func reloadCollection(){
        guard let delegate = delegate as? FeedViewController else { return }
        delegate.reloadCollection()
    }
}
