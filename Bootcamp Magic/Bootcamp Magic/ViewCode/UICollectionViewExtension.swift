//
//  UICollectionViewExtension.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 25/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

extension UICollectionView {
    func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 7, bottom: 10, right: 7)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width*0.30, height: (UIScreen.main.bounds.size.width*0.30)*1.5)
        self.collectionViewLayout = layout
        self.backgroundColor = .clear
        
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(_: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.self)")
        }
        return cell
    }
    
    func register<T: UICollectionViewCell>(_: T.Type){
        register(T.self, forCellWithReuseIdentifier: String(describing: T.self))
    }
}
