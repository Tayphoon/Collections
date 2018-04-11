//
//  CollectionController.swift
//  Collections
//
//  Created by Tayphoon on 14/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import UIKit

open class CollectionController<T>: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate where T: CollectionViewModel {
    private var _collectionView: UICollectionView?
    
    open var viewModel: T? {
        willSet {
            self.viewModel?.delegate = self
        }
    }
    
    open var collectionView: UICollectionView {
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

    open func numberOfSections() -> Int {
        return self.viewModel?.numberOfSections() ?? 0
    }

    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.numberOfItemsInSection(section)  ?? 0
    }

    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        var item = self.viewModel?.itemAtIndexPath(indexPath)
        var reuseIdentifier = self.viewModel?.reuseIdentifierForCellAtIndexPath(indexPath)

        if let cellObject = item as? CollectionCellObject {
            reuseIdentifier = cellObject.reuseIdentifier
            item = cellObject.item
            collectionView.register(cellObject.cellClass, forCellWithReuseIdentifier: cellObject.reuseIdentifier)
        }

        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier!, for: indexPath)

        if let collectionCell = cell as? CollectionCell {
            collectionCell.item = item
        }

        return cell
    }

    open func configureCollectionViewLayoutConstraints() {
        self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor)
        self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
    }
}

extension CollectionController : CollectionViewModelDelegate {
    
    open func modelDidChanged(_ model: CollectionViewModel) {
        self.collectionView.reloadData()
    }
    
    open func modelWillChangeContent(_ model: CollectionViewModel) {
        
    }
    
    open func model(_ model: CollectionViewModel, didChangeSectionAtIndex sectionIndex: Int, forChangeType type: Int) {
        
    }
    
    open func model(_ model: CollectionViewModel, didChangeObject object: Any, atIndexPath indexPath: IndexPath, forChangeType type: Int, newIndexPath: IndexPath) {
        
    }
    
    open func modelDidChangeContent(_ model: CollectionViewModel) {
        
    }
}
