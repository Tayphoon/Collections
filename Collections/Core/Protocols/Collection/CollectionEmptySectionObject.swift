//
//  CollectionEmptySectionObject.swift
//  Collections
//
//  Created by Tayphoon on 12/04/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

open class CollectionEmptySectionObject: CollectionSectionObject {
    
    public var cellObjects: [CellObject]?
    
    public var headerObject: SupplementaryViewObject?
    
    public var footerObject: SupplementaryViewObject?
    
    public var supplementaryViewObjects: [SupplementaryViewObject]?

    public required init() {

    }
}
