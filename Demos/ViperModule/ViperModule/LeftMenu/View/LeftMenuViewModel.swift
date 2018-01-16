//
//  LeftMenuViewModel.swift
//  ViperModule
//
//  Created by Tayphoon on 16/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Collections

class LeftMenuViewModel : TableModel {
    
    var items: Array<Any> = []
    var delegate: CollectionViewModelDelegate?

    func reuseIdentifierForCellAtIndexPath(_ indexPath: IndexPath) -> String {
        return ""
    }

    func heightForItemAtIndexPath(_ indexPath: IndexPath, constrainedToSize size: CGSize) -> CGSize {
        return CGSize.zero
    }
}
