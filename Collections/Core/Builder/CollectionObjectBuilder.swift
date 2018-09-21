//
//  CollectionObjectBuilder.swift
//  Collections
//
//  Created by Tayphoon on 11/04/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol CollectionObjectBuilder: class {
    
    func buildSectionObjects(for items:[Any]) -> [SectionObject]
    
    func buildCellObject(for item: Any) -> CellObject
}
