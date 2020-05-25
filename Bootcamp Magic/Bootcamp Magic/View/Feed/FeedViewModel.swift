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
    
    public func loadCards(){
        requestTypes()
        
    }
    
    private func requestTypes(){
        networkManager.getAllTypes { (types, error) in
            guard let types = types else { return }
            self.typesCards = types
            self.requestCards()
            types.forEach({ (type) in
                print(type)
            })
            
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
        }
    }
    
}
