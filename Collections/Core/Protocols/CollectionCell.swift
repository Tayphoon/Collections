//
//  CollectionCell.swift
//  Collections
//
//  Created by Tayphoon on 14/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol CollectionCell: class {

    associatedtype ItemType
    
    func configure(with _: ItemType)
}
