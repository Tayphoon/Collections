//
//  CollectionViewModel.swift
//  Collections
//
//  Created by Tayphoon on 13/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol CollectionViewModelDelegate: class {
    
    func modelDidChanged(_ model: CollectionViewModel)
}

public protocol CollectionViewModel {
    
    var delegate: CollectionViewModelDelegate? { get set }
    
    func numberOfSections() -> Int

    func numberOfItemsInSection(_ section: Int) -> Int
        
    func reuseIdentifierForCellAtIndexPath(_ indexPath: IndexPath) -> String
    
    func itemAtIndexPath(_ indexPath: IndexPath) -> Any?
    
    func indexPathOfObject(_ object: Any) -> IndexPath?
}

public extension CollectionViewModel {
    
    func modelDidChanged() {
        delegate?.modelDidChanged(self)
    }
}
