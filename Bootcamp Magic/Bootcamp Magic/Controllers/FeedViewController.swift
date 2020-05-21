//
//  FeedController.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    override func loadView() {
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        let view = FeedView()
        view.delegate = self
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FeedViewController: ViewDelegate {
    func didButtonPressed() {
        print("nada")
    }
    
}
