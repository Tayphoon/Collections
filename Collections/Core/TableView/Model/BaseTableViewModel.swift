//
//  BaseTableViewModel.swift
//  Collections
//
//  Created by Tayphoon on 12/04/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

open class BaseTableViewModel<T, B: CollectionObjectBuilder>: TableViewModel {

    public weak var delegate: CollectionViewModelDelegate?
    public var cellObjectsBuilder: B?
    private(set) var items: [CollectionSectionObject]?

    public init() {

    }

    open func numberOfSections() -> Int {
        return items?.count ?? 0
    }

    open func numberOfItemsInSection(_ section: Int) -> Int {
        if let count = items?.count, section < count {
            return items?[section].cellObjects?.count ?? 0
        }

        return 0
    }

    open func item(for section: Int) -> Any? {
        if let count = items?.count, section < count {
            return items?[section]
        }

        return nil
    }

    open func reuseIdentifierForCellAtIndexPath(_ indexPath: IndexPath) -> String {
        let cellObject = itemAtIndexPath(indexPath) as? CollectionCellObject

        if let reuseIdentifier = cellObject?.reuseIdentifier {
            return reuseIdentifier
        }

        return "CellIdenty"
    }

    open func itemAtIndexPath(_ indexPath: IndexPath) -> Any? {
        if indexPath.section < numberOfSections() && indexPath.row < numberOfItemsInSection(indexPath.section) {
            let cellObject = items?[indexPath.section].cellObjects?[indexPath.row]

            return cellObject
        }

        return nil
    }

    open func indexPathOfObject(_ object: Any) -> IndexPath? {
        return nil
    }

    open func configure(with items: [T]?) {
        self.items?.removeAll()

        if let items = items  {
            self.items = cellObjectsBuilder?.buildSectionObjects(for: items)
        }
    }
}
