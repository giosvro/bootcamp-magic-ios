//
//  FavoriteManager.swift
//  Bootcamp Magic
//
//  Created by giovanni.s.barros on 01/06/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FavoriteManager {
    
    let coreData = CoreData()
    let defaults = UserDefaults.standard
    let arrayFavoritesIds = UserDefaults.standard.array(forKey: "favoritesIds")
    var arraySave: [String] = []
    
    public func unfavorite(card: Card) {
        let id = card.id
        unfavorite(id: id)
    }
    
    private func unfavorite(id: String) {
        if arrayFavoritesIds != nil {
            arraySave = arrayFavoritesIds as! [String]
            arraySave = arraySave.filter( {$0 != id })
            coreData.deleteElementCoreData(id: id)
        }
        defaults.set(arraySave, forKey: "favoritesIds")
    }
    
    public func favoriteAction(card: Card) {
        let id = card.id
        if arrayFavoritesIds != nil {
            arraySave = arrayFavoritesIds as! [String]
        }
        coreData.saveCoreData(card: card)
        arraySave.append(id)
        defaults.set(arraySave, forKey: "favoritesIds")
    }
    
    public func unfavorite(card: CardCoreData) {
        guard let id = card.id else { return }
        var arraySave: [String] = []
        if arrayFavoritesIds != nil {
            arraySave = arrayFavoritesIds as! [String]
            arraySave = arraySave.filter( {$0 != id })
            coreData.deleteElementCoreData(id: id)
        }
        defaults.set(arraySave, forKey: "favoritesIds")
    }
}
