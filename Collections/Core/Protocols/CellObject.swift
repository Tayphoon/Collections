//
//  CellObject.swift
//  Collections
//
//  Created by Tayphoon on 21/09/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol CellObject: class {

    var reuseIdentifier: String { get }

    var cellClass: Swift.AnyClass { get }
}
