//
//  CollectionBaseObjectBuilder.swift
//  Collections
//
//  Created by Tayphoon on 11/04/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public typealias CellObjectType = InitializableItem & CellObject & ConfigurableCellObject
public typealias SectionObjectType = InitializableItem & SectionObject

open class CollectionBaseObjectBuilder<S: SectionObjectType, C: CellObjectType>: CollectionObjectBuilder {

    public init() {
        
    }

    open func buildSectionObjects(for items: [Any]) -> [SectionObject] {
        let section = S()
        var cellObjects = [CellObject]()

        for item in items {
            let cellObject = buildCellObject(for: item)
            cellObjects.append(cellObject)
        }

        section.cellObjects = cellObjects

        return [section]
    }

    open func buildCellObject(for item: Any) -> CellObject {
        var cellObject = C()

        if let item = item as? C.ItemType {
            cellObject.item = item
        }

        return cellObject
    }
}
