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
    var arrayCollectionCards: [[Card]] = []
    var arrayCardsAux: [[Card]] = []
    var types: [String]?
    var sets: [CardSet]?
    var networkManager = NetworkManager()
    var coordinatorDelegate: CoordinatorDelegate?
    var page = 1
    var iteratorType = 0
    var iteratorSet = 0
    var requestStatusFlag = false // in request or not
    var interatorTypeChanged = true
    var searchFlag = false
    var currentSectionType: [String] = []
    var currentSectionAux: [String] = []
    
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
                    self.manageData(cards: cards, type: type)
                }
            case .failure(let error):
                print("->", error)
            }
        }
        
    }
    
    private func manageData(cards: [Card], type: String) {
        print("cardCount     ::::: \(cards.count)")
        print("iteratorType  ::::: \(self.iteratorType)")
        
        let indice = arrayCollectionCards.count - 1
        
        if cards.count == 100 {
            print("============== loaded cards")
            page += 1
            arrayCards?.append(contentsOf: cards)
            reloadCollection()
            if interatorTypeChanged {
                arrayCollectionCards.append(cards)
                currentSectionType.append(type)
                interatorTypeChanged = false
            } else {
                arrayCollectionCards[indice] += cards
            }
        } else if cards.count == 0 {
            upDateIteratiors()
            requestCards()
        } else {
            print("============== loaded cards")
            if interatorTypeChanged {
                arrayCollectionCards.append(cards)
                currentSectionType.append(type)
            } else {
                arrayCollectionCards[indice] += cards
            }
            reloadCollection()
            upDateIteratiors()
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
        interatorTypeChanged = true
        page = 1
        
    }
    
    private func requestCardWithName(_ name: String) {
        networkManager.makeRequest(endpoint: .cardsWithName(name)) { [weak self] (result: Result<CardApiResponse, NetworkResponse>) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.arrayCardsAux = self.arrayCollectionCards
                    self.currentSectionAux = self.currentSectionType
                    self.arrayCollectionCards = [response.cards]
                    self.currentSectionType = [name]
                    self.reloadCollection()
                }
            case .failure(let error):
                self.feedViewErrorHandler(error: error)
            }
        }
    }
    
    func loadMoreCards(){
        if !requestStatusFlag, !searchFlag {
            requestCards()
        }
    }
    
    
    func showCard(indexPath: IndexPath, cardImage: UIImage?) {
        let card = arrayCollectionCards[indexPath.section][indexPath.row]
        coordinatorDelegate?.selectCard(card: card, cardImage: cardImage)
    }
    
    func searchCardsWith(name: String) {
        searchFlag = true
        prepareToReloadCollection()
        requestCardWithName(name)
    }
    
    func loadBackList(){
        arrayCollectionCards = arrayCardsAux
        currentSectionType = currentSectionAux
        searchFlag = false
        reloadCollection()
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
