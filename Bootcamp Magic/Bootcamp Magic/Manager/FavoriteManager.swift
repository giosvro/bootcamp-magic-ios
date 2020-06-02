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
    
    public func unfavorite(card: Card) {
        let id = card.id
        unfavorite(id: id)
    }
    
    private func unfavorite(id: String) {
        coreData.deleteElementCoreData(id: id)
    }
    
    public func favoriteAction(card: Card, imageData: Data?) {
        coreData.saveCoreData(card: card, imageData: imageData)
    }
    
    public func unfavorite(card: CardCoreData) {
        guard let id = card.id else { return }
        coreData.deleteElementCoreData(id: id)
    }
}
