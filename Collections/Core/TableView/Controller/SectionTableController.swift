//
//  SectionTableController.swift
//  Collections
//
//  Created by Tayphoon on 13/04/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

open class SectionTableController<T: TableViewModel>: TableController<T> {

    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerObject = (viewModel?.item(for: section) as? CollectionSectionObject)?.headerObject else {
            return nil
        }

        tableView.register(headerObject.supplementaryViewClass, forHeaderFooterViewReuseIdentifier: headerObject.reuseIdentifier)

        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerObject.reuseIdentifier)

        if var headerView = headerView as? SectionHeaderFooterView  {
            headerView.item = headerObject
        }

        return headerView
    }
}
