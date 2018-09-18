//
//  TableViewModel.swift
//  Collections
//
//  Created by Tayphoon on 14/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol TableViewModelDelegate: CollectionViewModelDelegate {
    
    func modelWillChangeContent(_ model: CollectionViewModel)
    
    func model(_ model: CollectionViewModel, didChangeSectionAtIndex sectionIndex: Int, forChangeType type: Int)
    
    func model(_ model: CollectionViewModel, didChangeObject object: Any, atIndexPath indexPath: IndexPath, forChangeType type: Int, newIndexPath: IndexPath)
    
    func modelDidChangeContent(_ model: CollectionViewModel)
}

public protocol TableViewModel: CollectionViewModel {
    
    func item(for section: Int) -> Any?
}
