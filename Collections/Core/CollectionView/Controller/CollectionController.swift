//
//  CollectionController.swift
//  Collections
//
//  Created by Tayphoon on 14/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import UIKit

/**
   AbstractCollectionController used to fix capability objc protocols with generic classes.
 */
open class AbstractCollectionController: UIViewController, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fatalError("Subclasses need to implement the `collectionView(collectionView:, numberOfItemsInSection:)` method.")
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        fatalError("Subclasses need to implement the `collectionView(collectionView:, cellForItemAt:)` method.")
    }
}

open class CollectionController<T>: AbstractCollectionController where T: CollectionViewModel {
    
    private var _collectionView: UICollectionView?
    
    open var viewModel: T! {
        willSet {
            viewModel.delegate = self
        }
    }
    
    open var collectionView: UICollectionView {
        get {
            if(_collectionView == nil) {
                let collectionViewFlowLayout = UICollectionViewFlowLayout()
                let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewFlowLayout)
                collectionView.translatesAutoresizingMaskIntoConstraints = false
                _collectionView = collectionView

                view.addSubview(collectionView)
                configureCollectionViewLayoutConstraints()
            }
            
            return _collectionView!
        }
    }
        
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
    }

    open func numberOfSections() -> Int {
        return viewModel.numberOfSections()
    }

    open override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }

    open override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        var item = viewModel.itemAtIndexPath(indexPath)
        var reuseIdentifier = viewModel?.reuseIdentifierForCellAtIndexPath(indexPath)

        if let cellObject = item as? CollectionCellObject {
            reuseIdentifier = cellObject.reuseIdentifier
            item = cellObject.item
            collectionView.register(cellObject.cellClass, forCellWithReuseIdentifier: cellObject.reuseIdentifier)
        }

        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier!, for: indexPath)

        if let collectionCell = cell as? CollectionCell, let item = item {
            collectionCell.configure(with: item)
        }

        return cell
    }

    open func configureCollectionViewLayoutConstraints() {
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension CollectionController: CollectionViewModelDelegate {
    
    open func modelDidChanged(_ model: CollectionViewModel) {
        collectionView.reloadData()
    }
}
