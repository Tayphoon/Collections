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
    
    func modelWillChangeContent(_ model: CollectionViewModel)
    
    func model(_ model: CollectionViewModel, didChangeSectionAtIndex sectionIndex: Int, forChangeType type: Int)
    
    func model(_ model: CollectionViewModel, didChangeObject object: Any, atIndexPath indexPath: IndexPath, forChangeType type: Int, newIndexPath: IndexPath)
    
    func modelDidChangeContent(_ model: CollectionViewModel)
}

public protocol CollectionViewModel {
    
    var delegate: CollectionViewModelDelegate? { get set }
    
    func numberOfSections() -> Int

    func numberOfItemsInSection(_ section: Int) -> Int
    
    func titleForSupplementaryElementOfKind(_ kind: String, atIndexPath indexPath: IndexPath)
    
    func reuseIdentifierForCellAtIndexPath(_ indexPath: IndexPath) -> String
    
    func reuseIdentifierForSupplementaryElementOfKind(_ kind: String, atIndexPath indexPath: IndexPath) -> String
    
    func itemAtIndexPath(_ indexPath: IndexPath) -> Any?
    
    func indexPathOfObject(_ object: Any) -> IndexPath?
}

public extension CollectionViewModel {
    
    public func modelDidChanged() {
        delegate?.modelDidChanged(self)
    }
    
    public func modelWillChangeContent() {
        delegate?.modelWillChangeContent(self)
    }
    
    public func model(didChangeSectionAtIndex sectionIndex: Int, forChangeType type: Int) {
        delegate?.model(self, didChangeSectionAtIndex: sectionIndex, forChangeType: type)
    }
    
    public func model(didChangeObject object: Any, atIndexPath indexPath: IndexPath, forChangeType type: Int, newIndexPath: IndexPath) {
        delegate?.model(self, didChangeObject: object, atIndexPath: indexPath, forChangeType: type, newIndexPath: newIndexPath)
    }
    
    public func modelDidChangeContent() {
        delegate?.modelDidChangeContent(self)
    }
}
