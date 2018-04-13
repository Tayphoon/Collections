//
//  SectionTableController.swift
//  Collections
//
//  Created by Tayphoon on 13/04/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import Foundation

class SectionTableController<T: TableViewModel>: TableController<T> {

    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let item = self.viewModel?.item(for: section)
        var reuseIdentifier: String? = nil

        if let sectionObject = item as? CollectionSectionObject, let headerObject = sectionObject.headerObject {
            reuseIdentifier = headerObject.reuseIdentifier
            tableView.register(headerObject.supplementaryViewClass, forHeaderFooterViewReuseIdentifier: headerObject.reuseIdentifier)
        }

        if let viewIdentifier = reuseIdentifier {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: viewIdentifier)
            return headerView
        }

        return nil
    }
}
