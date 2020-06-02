//
//  FavoritesViewModel.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 02/06/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import Foundation

class FavoritesViewModel {
    var delegate: ViewDelegate?
    var arrayCards: [Card] = []
    var arrayCollectionCards: [[Card]] = []
    var types: [String]?
    var sets: [CardSet]?
    var networkManager = NetworkManager()
    var coordinatorDelegate: CoordinatorDelegate?
    var searchFlag = false
    var currentSectionType: [String] = []
    
    public func loadCards(){
        CoreData().getElementCoreData()?.forEach({ (card) in
            print(";;;;; - ", card.name, card.image)
        })
    }
}
