//
//  TableViewModel.swift
//  Collections
//
//  Created by Tayphoon on 14/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol TableViewModel {
    
    var delegate: CollectionViewModelDelegate? { get set }
    
    func numberOfSections() -> Int
    
    func numberOfItemsInSection(_ section: Int) -> Int
    
    func reuseIdentifierForCellAtIndexPath(_ indexPath: IndexPath) -> String

    func item(for section: Int) -> Any?

    func itemAtIndexPath(_ indexPath: IndexPath) -> Any?
    
    func indexPathOfObject(_ object: Any) -> IndexPath?
}
