//
//  CollectionReusableView.swift
//  Collections
//
//  Created by Tayphoon on 13/04/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol CollectionReusableView {

    associatedtype ItemType
    
    func configure(with _: ItemType)
}
