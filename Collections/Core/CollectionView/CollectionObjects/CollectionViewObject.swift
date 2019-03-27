//
//  SupplementaryView.swift
//  Collections
//
//  Created by Tayphoon on 21/09/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import UIKit

open class CollectionViewObject<ViewType: CollectionReusableView>: SupplementaryViewObject where ViewType: UICollectionReusableView {

    open var item: ViewType.ItemType

    open var reuseIdentifier: String

    open var reusableViewClass: Swift.AnyClass

    open var elementKind: String

    public init(_ item: ViewType.ItemType, reuseIdentifier: String, reusableViewClass: Swift.AnyClass, elementKind: String) {
        self.item = item
        self.reuseIdentifier = reuseIdentifier
        self.reusableViewClass = reusableViewClass
        self.elementKind = elementKind
    }

    open func configure(_ view: UIView) {
        (view as? ViewType)?.configure(with: item)
    }
}
