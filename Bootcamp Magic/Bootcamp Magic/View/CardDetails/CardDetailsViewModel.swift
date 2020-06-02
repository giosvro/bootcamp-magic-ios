//
//  CardDetailsViewModel.swift
//  Bootcamp Magic
//
//  Created by giovanni.s.barros on 01/06/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class CardDetailsViewModel {
    private var favoriteManager: FavoriteManager
    var cardImage: UIImage?
    var card: Card?
    
    init() {
        self.favoriteManager = FavoriteManager()
    }
    
    func favoriteButtonPressed() {

        if checkCardFavoriteStatus() == true {
            self.unfavoriteAction()
        } else {
            self.favoriteAction()
        }
        
        CoreData().getElementCoreData()?.forEach({ (card) in
            print(";;;;; - ", card.name, card.image)
        })
        print("-------------")
    }
    
    private func favoriteAction() {
        guard let card = self.card else { return }
        guard let cardImage = self.cardImage else { return }
        favoriteManager.favoriteAction(card: card, imageData: cardImage.pngData())
    }
    
    private func unfavoriteAction() {
        guard let card = self.card else { return }
        favoriteManager.unfavorite(card: card)
    }
    
    func checkCardFavoriteStatus() -> Bool {
        let favoriteCards = favoriteManager.coreData.getElementCoreData()
        var result: Bool = false
        favoriteCards?.forEach({ [weak self] (card) in
            guard let self = self else { return }
            if self.card?.id == card.id {
                result = true
            }
        })
        return result
    }
}
