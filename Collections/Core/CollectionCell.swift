//
//  CollectionCell.swift
//  Collections
//
//  Created by Tayphoon on 14/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol CollectionCell {
    var item: Any? { get set }
    
    static func sizeForItem(_ item: Any, constrainedToSize size: CGSize) -> CGSize
}
