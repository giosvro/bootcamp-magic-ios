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
    var types: [String]?
    var networkManager = NetworkManager()
    var coordinatorDelegate: CoordinatorDelegate?
    
    public func loadCards(){
        requestTypes()
    }
    
    private func requestTypes(){
        networkManager.makeRequest(endpoint: .types) { (result: Result<CardTypeApiResponse, NetworkResponse>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    response.types.forEach { (type) in
                        print(type)
                    }
                    self.types = response.types
                    self.requestCards()
                }
            case .failure(let error):
                print(error)
            }
            
        }
        
        //        networkManager.getAllTypes { (types, error) in
        //            guard let types = types else { return }
        //            self.typesCards = types
        //            DispatchQueue.main.async {
        //                types.forEach({ (type) in
        //                    print(type)
        //                })
        //                self.requestCards()
        //            }
        //
        //        }
    }
    
    private func requestCards(){
        guard let type = types?.first else { return }
        
        networkManager.makeRequest(endpoint: .cards(1, "KTK", type)) { (result: Result<CardApiResponse, NetworkResponse>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    response.cards.forEach { (card) in
                        print(card.name)
                    }
                    self.arrayCards = response.cards
                    self.reloadCollection()
                }
            case .failure(let error):
                print("->", error)
            }
        }
        
        //        networkManager.getAllCards(page: 1, set: "KTK", type: type) { (cards, error) in
        //            guard let cards = cards else { return }
        //            self.arrayCards = cards
        //            cards.forEach({ (card) in
        //                print(card)
        //            })
        //            self.reloadCollection()
        //        }
    }
    
    private func requestCardWithName(_ name: String) {
        
        networkManager.makeRequest(endpoint: .cardsWithName(name)) { [weak self] (result: Result<CardApiResponse, NetworkResponse>) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.arrayCards = response.cards
                    self.reloadCollection()
                }
            case .failure(let error):
                self.feedViewErrorHandler(error: error)
            }
        }
    }
    
    
    func showCard(item: Int, cardImage: UIImage?) {
        guard let card = arrayCards?[item] else {
            return
        }
        coordinatorDelegate?.selectCard(card: card, cardImage: cardImage)
    }
    
    func searchCardsWith(name: String) {
        prepareToReloadCollection()
        requestCardWithName(name)
    }
    
    func prepareToReloadCollection() {
        guard let delegate = delegate as? FeedViewController else { return }
        delegate.prepareToReloadCollection()
    }
    
    func reloadCollection(){
        guard let delegate = delegate as? FeedViewController else { return }
        delegate.reloadCollection()
    }
    
    func feedViewErrorHandler(error: NetworkResponse) {
        
    }
}
