//
//  FeedController.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    let feedViewModel: FeedViewModel
    var collectionView: UICollectionView?
    lazy var dataSource = FeedCollectionViewDataSource(viewModel: feedViewModel)
    var isLoading = false
    
    init(feedViewModel: FeedViewModel){
        self.feedViewModel = feedViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = FeedView()
        feedViewModel.delegate = self
        view.delegate = self
        view.searchBar.delegate = self
        self.collectionView = view.collectionView
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = dataSource
        self.collectionView?.register(CardsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(CardsHeaderView.self)")
        self.collectionView?.register(CollectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "\(CollectionFooterView.self)")
        
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
    
    func errorFeedback(message: String) {
        guard let view = self.view as? FeedView else { return }
        view.errorLabel.text = message
    }
}

extension FeedViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cardCell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell else { return }
        feedViewModel.showCard(indexPath: indexPath, cardImage: cardCell.cardImage.image)
    }
    
    func prepareToReloadCollection() {
        DispatchQueue.main.async {
            self.collectionView?.isHidden = true
            self.view.activityStartAnimating()
        }
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if isLoading {
            isLoading = false
            return CGSize.zero
        } else {
            isLoading = true
            return CGSize(width: UIScreen.main.bounds.width, height: 44)
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        isLoading = false
        let currentVerticalOffset = scrollView.contentOffset.y
        let maximumVerticalOffset = scrollView.contentSize.height - scrollView.frame.height
        let percentageVerticalOffset = maximumVerticalOffset * 0.5
        if currentVerticalOffset >= percentageVerticalOffset {
            feedViewModel.loadMoreCards()
            isLoading = true
        }
    }
    
}


extension FeedViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            feedViewModel.loadBackList()
        } else if searchText.count%3 == 0 {
            feedViewModel.searchCardsWith(name: searchText)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        feedViewModel.searchCardsWith(name: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        feedViewModel.prepareToReloadCollection()
        feedViewModel.loadBackList()
        searchBar.text = ""
        self.errorFeedback(message: "")
    }
}
