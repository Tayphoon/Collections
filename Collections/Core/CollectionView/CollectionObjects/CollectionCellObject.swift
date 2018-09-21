//
//  CollectionConfigurableObject.swift
//  Collections
//
//  Created by Tayphoon on 14/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import UIKit

public protocol CollectionConfigurableObject: CellObject {
    
    func configure(_ cell: UICollectionViewCell)
}

open class CollectionCellObject<CellType: CollectionCell>: ConfigurableCellObject, CollectionConfigurableObject where CellType: UICollectionViewCell {

    open var item: CellType.ItemType

    open var reuseIdentifier: String

    open var cellClass: Swift.AnyClass

    public init(item: CellType.ItemType, reuseIdentifier: String, cellClass: Swift.AnyClass) {
        self.item = item
        self.reuseIdentifier = reuseIdentifier
        self.cellClass = cellClass
    }

    open func configure(_ cell: UICollectionViewCell) {
        (cell as? CellType)?.configure(with: item)
    }
}
