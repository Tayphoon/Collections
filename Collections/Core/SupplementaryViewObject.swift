//
//  CollectionHeaderFooterObject.swift
//  Collections
//
//  Created by Tayphoon on 11/04/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol SupplementaryViewObject {
    var reuseIdentifier: String { get }
    var supplementaryViewClass: Swift.AnyClass { get }
    var elementKind: String { get }
    var item: Any? { get }
}
