//
//  FeedController.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    let feedViewModel = FeedViewModel()
    var collectionView: UICollectionView?
    var dataSource: FeedCollectionViewDataSource!
        
    override func loadView() {
        let view = FeedView()
        feedViewModel.delegate = self
        view.delegate = self
        self.collectionView = view.collectionView
        self.collectionView?.delegate = self
        self.dataSource = FeedCollectionViewDataSource(viewModel: feedViewModel)
        self.collectionView?.dataSource = dataSource
        self.collectionView?.register(CardsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(CardsHeaderView.self)")
        self.view = view
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let flowLayout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.sectionFootersPinToVisibleBounds = true
//            flowLayout.sectionHeadersPinToVisibleBounds = true
//            flowLayout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 90)
//        }
        feedViewModel.loadCards()
    }
}

extension FeedViewController: ViewDelegate {
    func didButtonPressed() {
        
    }
    
}

extension FeedViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        feedViewModel.showCard(item: indexPath.item)
    }
    
    func reloadCollection() {
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
            self.collectionView?.isHidden = false
            self.view.activityStopAnimating()
        }
    }
    
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let usableWidth = collectionView.frame.width * 0.29
        
        let cellWidth: CGFloat = usableWidth
        let cellHeight: CGFloat = usableWidth * 1.4
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}



//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        print("////////////// sera que vai?")
//        if kind == UICollectionView.elementKindSectionHeader {
//             let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! SectionHeader
//             sectionHeader.label.text = "Teste"
//             return sectionHeader
//        } else { //No footer in this case but can add option for that
//             return UICollectionReusableView()
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        print("////////////// header size")
//        return CGSize(width: collectionView.frame.width, height: 40)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        print("////////////// footer")
//        return CGSize(width: collectionView.frame.width, height: 40)
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 8
//    }
