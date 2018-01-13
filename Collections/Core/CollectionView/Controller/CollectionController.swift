//
//  CollectionController.swift
//  Collections
//
//  Created by Tayphoon on 14/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import UIKit

open class CollectionController: UIViewController {
    private var _collectionView: UICollectionView?
    
    
    public var viewModel: CollectionViewModel? {
        willSet {
            self.viewModel?.delegate = self
        }
    }
    
    public var collectionView: UICollectionView {
        get {
            if(_collectionView == nil) {
                let collectionViewFlowLayout = UICollectionViewFlowLayout()
                let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewFlowLayout)
                collectionView.translatesAutoresizingMaskIntoConstraints = false
                _collectionView = collectionView

                self.view.addSubview(collectionView)
                configureCollectionViewLayoutConstraints()
            }
            
            return _collectionView!
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
}

extension CollectionController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    public func numberOfSections() -> Int {
        if let viewModel = self.viewModel {
            return viewModel.numberOfSections()
        }
        
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let viewModel = self.viewModel {
            return viewModel.numberOfItemsInSection(section)
        }
        
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell = UICollectionViewCell()
        if let viewModel = self.viewModel  {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.reuseIdentifierForCellAtIndexPath(indexPath), for: indexPath)
        }
        
        return cell
    }
}

extension CollectionController : CollectionViewModelDelegate {
    
    public func modelDidChanged(_ model: CollectionViewModel) {
        self.collectionView.reloadData()
    }
    
    public func modelWillChangeContent(_ model: CollectionViewModel) {
        
    }
    
    public func model(_ model: CollectionViewModel, didChangeSectionAtIndex sectionIndex: UInt, forChangeType type: UInt) {
        
    }
    
    public func model(_ model: CollectionViewModel, didChangeObject object: Any, atIndexPath indexPath: IndexPath, forChangeType type: UInt, newIndexPath: IndexPath) {
        
    }
    
    public func modelDidChangeContent(_ model: CollectionViewModel) {
        
    }
}

/// Layout extension.
private extension CollectionController {
    
    private func configureCollectionViewLayoutConstraints() {
        self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor)
        self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
    }
}
