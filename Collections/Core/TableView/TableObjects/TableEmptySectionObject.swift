//
//  TableEmptySectionObject.swift
//  Collections
//
//  Created by Tayphoon on 21/09/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

open class TableEmptySectionObject: InitializableItem, SectionObject {

    public var cellObjects: [CellObject]?

    public var headerObject: ReusableViewObject?

    public var footerObject: ReusableViewObject?

    public required init() {

    }
}
