//
//  TableModel.swift
//  Collections
//
//  Created by Tayphoon on 14/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol TableModel: TableViewModel {
    
    var items: [Any] { get }
    
    func updateModelWithCompletion(_ completion: ((Error) -> Swift.Void)?)
}

public extension TableModel {
    
    public func numberOfSections() -> Int {
        return 1
    }
    
    public func numberOfItemsInSection(_ section: Int) -> Int {
        return items.count
    }
    
    public func itemAtIndexPath(_ indexPath: IndexPath) -> Any? {
        if indexPath.row < items.count {
            return items[indexPath.row]
        }
        
        return nil
    }
    
    public func indexPathOfObject(_ object: Any) -> IndexPath? {
        return nil
    }
}
