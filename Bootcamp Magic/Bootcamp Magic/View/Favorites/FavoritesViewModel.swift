//
//  FavoritesViewModel.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 02/06/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FavoritesViewModel {
    var delegate: ViewDelegate?
    var arrayCards: [CardCoreData] = []
    var coordinatorDelegate: CoordinatorDelegate?
    let coreData = CoreData()
    
    public func loadCards(){
        guard let arrayCards = coreData.getElementCoreData() else { return }
        self.arrayCards = arrayCards
        reloadCollection()
    }
    
    private func reloadCollection(){
        guard let delegate = delegate as? FavoritesViewController else { return }
        delegate.reloadCollection()
    }
    
    func showCard(indexPath: IndexPath, cardImage: UIImage?) {
        let cardCoreData = arrayCards[indexPath.item]
        let card = Card(card: cardCoreData)
        coordinatorDelegate?.selectCard(card: card, cardImage: cardImage)
    }
    
}
