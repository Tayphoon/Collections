//
//  TableSectionViewObject.swift
//  Collections
//
//  Created by Tayphoon on 21/09/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

open class TableSectionViewObject<ViewType: CollectionReusableView>: ReusableViewObject where ViewType: UIView {

    open var item: ViewType.ItemType

    open var reuseIdentifier: String

    open var reusableViewClass: Swift.AnyClass

    public init(_ item: ViewType.ItemType, reuseIdentifier: String, reusableViewClass: Swift.AnyClass) {
        self.item = item
        self.reuseIdentifier = reuseIdentifier
        self.reusableViewClass = reusableViewClass
    }

    open func configure(_ view: UIView) {
        (view as? ViewType)?.configure(with: item)
    }
}
