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
    
    private let headerId = "HeaderId"
    
    override func loadView() {
        let view = FeedView()
        feedViewModel.delegate = self
        view.delegate = self
        self.collectionView = view.collectionView
        self.collectionView?.delegate = self
        self.dataSource = FeedCollectionViewDataSource(viewModel: feedViewModel)
        self.collectionView?.dataSource = dataSource
        self.collectionView?.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let flowLayout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.sectionFootersPinToVisibleBounds = true
        }
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        print("////////////// sera que vai?")
        if kind == UICollectionView.elementKindSectionHeader {
             let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! SectionHeader
             sectionHeader.label.text = "Teste"
             return sectionHeader
        } else { //No footer in this case but can add option for that
             return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        print("////////////// header size")
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        print("////////////// footer")
        return CGSize(width: collectionView.frame.width, height: 40)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let usableWidth = collectionView.frame.width * 0.29

        let cellWidth: CGFloat = usableWidth
        let cellHeight: CGFloat = usableWidth * 1.4

        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    
}



class SectionHeader: UICollectionReusableView {
     var label: UILabel = {
     let label: UILabel = UILabel()
     label.textColor = .white
     label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
     label.sizeToFit()
     return label
     }()

    override init(frame: CGRect) {
         super.init(frame: frame)

         addSubview(label)

         label.translatesAutoresizingMaskIntoConstraints = false
         label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
         label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
         label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

