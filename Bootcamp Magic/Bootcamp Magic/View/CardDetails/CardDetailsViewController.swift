//
//  CardDetailsViewController.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 22/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class CardDetailsViewController: UIViewController {
    
    let cardDetailsViewModel: CardDetailsViewModel
    var coordinator: Coordinator?
    var cardName = UILabel()
    
    init(card: Card, cardImage: UIImage?) {
        self.cardDetailsViewModel = CardDetailsViewModel()
        cardDetailsViewModel.card = card
        cardDetailsViewModel.cardImage = cardImage
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = CardDetailsView()
        view.delegate = self
        view.cardImage.image = cardDetailsViewModel.cardImage
        cardName = view.label
        self.view = view
        view.quitButton.addTarget(self, action: #selector(self.dismissScreen), for: .touchUpInside)
        view.favoriteButton.addTarget(self, action: #selector(self.favoriteButtonPressed), for: .touchUpInside)
        setupButtonTitle()
        setupCardName()
    }
    
    @objc func dismissScreen() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func favoriteButtonPressed() {
        cardDetailsViewModel.favoriteButtonPressed()
        setupButtonTitle()
    }
    
    private func setupButtonTitle() {
        guard let cardDetailView = view as? CardDetailsView else { return }
        if cardDetailsViewModel.checkCardFavoriteStatus() == false {
            cardDetailView.favoriteButton.setTitle(Strings.FavoriteButtonStates.favoriteText, for: .normal)
        } else {
            cardDetailView.favoriteButton.setTitle(Strings.FavoriteButtonStates.removeFavoriteText, for: .normal)
        }
    }
    
    private func setupCardName(){
        guard let name = cardDetailsViewModel.card?.name else { return }
        guard let _ = cardDetailsViewModel.card?.imageUrl else {
            cardName.text = name
            cardName.isHidden = false
            return
        }
        cardName.isHidden = true
    }
}

extension CardDetailsViewController: ViewDelegate {
    
    func didButtonPressed() {
        
    }
    
}
