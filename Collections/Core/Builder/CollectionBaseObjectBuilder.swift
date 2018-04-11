//
//  CollectionBaseObjectBuilder.swift
//  Collections
//
//  Created by Tayphoon on 11/04/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

open class CollectionBaseObjectBuilder<U, C: CollectionCellObject, S: CollectionSectionObject>: CollectionObjectBuilder {
    public typealias T = U

    open func buildSectionObjects(for items: [U]) -> [CollectionSectionObject]? {

        let section = S()
        var cellObjects = [CollectionCellObject]()

        for item in items {
            if let cellObject = buildCellObject(for: item) {
                cellObjects.append(cellObject)
            }
        }

        section.cellObjects = cellObjects

        return [section]
    }

    open func buildCellObject(for item: U) -> CollectionCellObject? {
        let cellObject = C()
        cellObject.item = item

        return cellObject
    }
}
