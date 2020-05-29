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
    var sets: [CardSet]?
    var networkManager = NetworkManager()
    var coordinatorDelegate: CoordinatorDelegate?
    var page = 1
    var iteratorType = 0
    var iteratorSet = 0
    var sectionsCollection = 0
    var requestStatusFlag = false // in request or not
    
    public func loadCards(){
        self.arrayCards = []
        requestTypes()
    }
    
    private func requestTypes(){
        networkManager.makeRequest(endpoint: .types) { (result: Result<CardTypeApiResponse, NetworkResponse>) in
            print("============== loaded types")
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
//                    response.types.forEach { (type) in
//                        print(type)
//                    }
                    self.types = response.types
                    self.requestSets()
                }
            case .failure(let error):
                print(error)
            }
            
        }

    }
    
    private func requestSets() {
        
        networkManager.makeRequest(endpoint: .sets) { (result: Result<SetApiResponse, NetworkResponse>) in
            print("============== loaded sets")
            switch result {
            case .success(let response):
//                response.sets.forEach { (sets) in
//                    print(sets)
//                }
                self.sets = response.sets
                self.requestCards()
            case .failure(let error):
                print(error)
            }
        }

    }
    
    private func requestCards(){
        guard let sets = sets else { return }
        guard let types = types else { return }
        
        let type = types[iteratorType]
        let setCard = sets[iteratorSet].code
        
        requestStatusFlag = true
        networkManager.makeRequest(endpoint: .cards(page, setCard, type)) { (result: Result<CardApiResponse, NetworkResponse>) in
           
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    let cards = response.cards
//                    response.cards.forEach { (card) in
//                        print(card.name)
//                    }
                    print("cardCount::::: \(cards.count)")
                    print("iteratorType::::: \(self.iteratorType)")
                    if cards.count == 100{
                        print("============== loaded cards")
                        self.page += 1
                        self.arrayCards?.append(contentsOf: cards)
                        self.reloadCollection()
                    } else if cards.count == 0 {
                        self.upDateIteratiors()
                        self.requestCards()
                    } else {
                        print("============== loaded cards")
                        self.upDateIteratiors()
                        self.arrayCards?.append(contentsOf: cards)
                        self.reloadCollection()
                        self.sectionsCollection += 1
                    }
                }
            case .failure(let error):
                print("->", error)
            }
        }
        
    }
    
    private func upDateIteratiors(){
        guard let types = types else { return }
        
        if iteratorType < types.count - 1 {
            iteratorType += 1
            
        } else {
            iteratorSet += 1
            iteratorType = 0
        }
        page = 1
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
    
    func loadMoreCards(){
        if !requestStatusFlag {
            requestCards()
        }
    }
    
    
    func showCard(item: Int) {
        guard let card = arrayCards?[item] else {
            return
        }
        coordinatorDelegate?.selectCard(card: card)
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
        requestStatusFlag = false
        guard let delegate = delegate as? FeedViewController else { return }
        delegate.reloadCollection()
    }
    
    func feedViewErrorHandler(error: NetworkResponse) {
        
    }
}
