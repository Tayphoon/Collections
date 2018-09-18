//
//  TableCollectionModel.swift
//  Collections
//
//  Created by Tayphoon on 18/09/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

open class TableCollectionModel<ItemType, Builder: CollectionObjectBuilder>: ObjectCollectionModel<ItemType, Builder>, TableViewModel {
    
    public func item(for section: Int) -> Any? {
        if section < numberOfSections() {
            return items?[section]
        }
        
        return nil
    }
}
