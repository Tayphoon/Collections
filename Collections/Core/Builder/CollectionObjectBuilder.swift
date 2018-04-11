//
//  CollectionObjectBuilder.swift
//  Collections
//
//  Created by Tayphoon on 11/04/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol CollectionObjectBuilder: class {
    associatedtype T
    func buildSectionObjects(for items:[T]) -> [CollectionSectionObject]?
    func buildCellObject(for item: T) -> CollectionCellObject?
}
