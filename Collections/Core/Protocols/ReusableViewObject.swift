//
//  ReusableViewObject.swift
//  Collections
//
//  Created by Tayphoon on 21/09/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol ReusableViewObject {

    var reuseIdentifier: String { get }

    var reusableViewClass: Swift.AnyClass { get }

    func configure(_ view: UIView)
}
