//
//  CollectionModel.swift
//  Collections
//
//  Created by Tayphoon on 13/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol CollectionModel: CollectionViewModel {
    
    associatedtype ItemType
    
    var items: [ItemType] { get }
}

public extension CollectionModel {
    
    public func numberOfSections() -> Int {
        return 1
    }
    
    public func numberOfItemsInSection(_ section: Int) -> Int {
        return items.count
    }
    
    public func itemAtIndexPath(_ indexPath: IndexPath) -> ItemType? {
        if indexPath.row < items.count {
            return items[indexPath.row]
        }
        
        return nil
    }
}
