//
//  TableConfigurableObject.swift
//  Collections
//
//  Created by Tayphoon on 21/09/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import UIKit

public protocol TableConfigurableObject: CellObject {

    func configure(_ cell: UITableViewCell)
}

open class TableCellObject<CellType: CollectionCell>: ConfigurableCellObject, TableConfigurableObject where CellType: UITableViewCell {

    open var item: CellType.ItemType

    open var reuseIdentifier: String

    open var cellClass: Swift.AnyClass

    public init(_ item: CellType.ItemType, reuseIdentifier: String, cellClass: Swift.AnyClass) {
        self.item = item
        self.reuseIdentifier = reuseIdentifier
        self.cellClass = cellClass
    }

    open func configure(_ cell: UITableViewCell) {
        (cell as? CellType)?.configure(with: item)
    }
}
