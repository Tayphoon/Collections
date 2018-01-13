//
//  File.swift
//  Collections
//
//  Created by Tayphoon on 13/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol CollectionModel : CollectionViewModel {
    
    var items: Array<Any> { get }
    
    func updateModelWithCompletion(_ completion: ((Error) -> Swift.Void)?)
}

public extension CollectionModel {
    
    public func numberOfSections() -> Int {
        return 0
    }
    
    public func numberOfItemsInSection(_ section: UInt32) -> Int {
        return self.items.count
    }
    
    public func itemAtIndexPath(_ indexPath: IndexPath) -> Any? {
        if indexPath.row < self.items.count {
            return self.items[indexPath.row]
        }
        
        return nil
    }
}
