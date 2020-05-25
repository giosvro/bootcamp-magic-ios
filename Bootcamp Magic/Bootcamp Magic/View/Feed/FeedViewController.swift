//
//  FeedController.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    var coordinator: Coordinator?
    let feedViewModel = FeedViewModel()
    
    override func loadView() {
        let view = FeedView()
        view.delegate = self
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedViewModel.loadCards()
    }
}

extension FeedViewController: ViewDelegate {
    func didButtonPressed() {
    }
    
}

extension FeedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let coodinator = coordinator as? FeedCoordinator else {
            return
        }
        coodinator.presentCardDetails()
    }
       
}
