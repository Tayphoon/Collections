//
//  CollectionViewModel.swift
//  Collections
//
//  Created by Tayphoon on 13/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol CollectionViewModelDelegate {
    
    func modelDidChanged(_ model: CollectionViewModel)
    
    func modelWillChangeContent(_ model: CollectionViewModel)
    
    func model(_ model: CollectionViewModel, didChangeSectionAtIndex sectionIndex: UInt, forChangeType type: UInt)
    
    func model(_ model: CollectionViewModel, didChangeObject object: Any, atIndexPath indexPath: IndexPath, forChangeType type: UInt, newIndexPath: IndexPath)
    
    func modelDidChangeContent(_ model: CollectionViewModel)
}

public protocol CollectionViewModel {
    
    var delegate: CollectionViewModelDelegate? { get set }
    
    func numberOfSections() -> Int

    func numberOfItemsInSection(_ section: Int) -> Int
    
    func titleForSupplementaryElementOfKind(_ kind: String, atIndexPath indexPath: IndexPath)
    
    func reuseIdentifierForCellAtIndexPath(_ indexPath: IndexPath) -> String
    
    func reuseIdentifierForSupplementaryElementOfKind(_ kind: String, atIndexPath indexPath: IndexPath) -> String

    func sizeForItemAtIndexPath(_ indexPath: IndexPath, constrainedToSize size: CGSize) -> CGSize
    
    func itemAtIndexPath(_ indexPath: IndexPath) -> Any
    
    func indexPathOfObject(_ object: Any) -> IndexPath?
}

public extension CollectionViewModel {
    
    public func modelDidChanged() {
        self.delegate?.modelDidChanged(self)
    }
    
    public func modelWillChangeContent() {
        self.delegate?.modelWillChangeContent(self)
    }
    
    public func model(didChangeSectionAtIndex sectionIndex: UInt, forChangeType type: UInt) {
        self.delegate?.model(self, didChangeSectionAtIndex: sectionIndex, forChangeType: type)
    }
    
    public func model(didChangeObject object: Any, atIndexPath indexPath: IndexPath, forChangeType type: UInt, newIndexPath: IndexPath) {
        self.delegate?.model(self, didChangeObject: object, atIndexPath: indexPath, forChangeType: type, newIndexPath: newIndexPath)
    }
    
    public func modelDidChangeContent() {
        self.delegate?.modelDidChangeContent(self)
    }
}
