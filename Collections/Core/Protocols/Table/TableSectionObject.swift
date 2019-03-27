//
//  TableSectionObject.swift
//  Collections
//
//  Created by Tayphoon on 21/09/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol TableSectionObject: SectionObject {
    
    var headerObject: ReusableViewObject? { get }

    var footerObject: ReusableViewObject? { get }
}
