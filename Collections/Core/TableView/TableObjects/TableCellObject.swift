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

    public required init(_ item: CellType.ItemType) {
        self.item = item
        self.cellClass = CellType.self
        self.reuseIdentifier = String(describing: self.cellClass)
    }

    open func configure(_ cell: UITableViewCell) {
        (cell as? CellType)?.configure(with: item)
    }
}
