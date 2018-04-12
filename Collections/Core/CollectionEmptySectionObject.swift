//
//  CollectionEmptySectionObject.swift
//  Collections
//
//  Created by Tayphoon on 12/04/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

class CollectionEmptySectionObject: CollectionSectionObject {
    var cellObjects: [CollectionCellObject]?
    var headerObject: SupplementaryViewObject?
    var footerObject: SupplementaryViewObject?
    var supplementaryViewObjects: [SupplementaryViewObject]?

    required init() {

    }
}
