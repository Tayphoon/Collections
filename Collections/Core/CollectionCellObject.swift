//
//  File.swift
//  Collections
//
//  Created by Tayphoon on 14/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol CollectionCellObject: class {
    var reuseIdentifier: String { get }
    var cellClass: Swift.AnyClass { get }
    var item: Any? { get }
}
