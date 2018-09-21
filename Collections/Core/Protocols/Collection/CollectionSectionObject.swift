//
//  CollectionSectionObject.swift
//  Collections
//
//  Created by Tayphoon on 11/04/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

public protocol CollectionSectionObject: SectionObject {

    var headerObject: SupplementaryViewObject? { get }

    var footerObject: SupplementaryViewObject? { get }

    var supplementaryViewObjects: [SupplementaryViewObject]? { get }
}
