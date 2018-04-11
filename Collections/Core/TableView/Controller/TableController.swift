//
//  TableController.swift
//  Collections
//
//  Created by Tayphoon on 14/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import UIKit

open class TableController<T>: UIViewController, UITableViewDelegate, UITableViewDataSource where T: TableViewModel  {
    private var _tableView: UITableView?

    open var tableView: UITableView {
        get {
            if(_tableView == nil) {
                let tableView = UITableView()
                tableView.translatesAutoresizingMaskIntoConstraints = false
                _tableView = tableView
                
                self.view.addSubview(tableView)
                configureTableViewLayoutConstraints()
            }
            
            return _tableView!
        }
    }
    
    open var viewModel: T? {
        willSet {
            self.viewModel?.delegate = self
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    open func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel?.numberOfSections() ?? 0
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.numberOfItemsInSection(section) ?? 0
    }

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

    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let item = self.viewModel?.item(for: section)
        var reuseIdentifier: String? = nil

        if let sectionObject = item as? CollectionSectionObject, let footerObject = sectionObject.headerObject {
            reuseIdentifier = footerObject.reuseIdentifier
            tableView.register(footerObject.supplementaryViewClass, forHeaderFooterViewReuseIdentifier: footerObject.reuseIdentifier)
        }

        if let viewIdentifier = reuseIdentifier {
            let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: viewIdentifier)
            return footerView
        }

        return nil
    }

    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item = self.viewModel?.itemAtIndexPath(indexPath)
        var reuseIdentifier = self.viewModel?.reuseIdentifierForCellAtIndexPath(indexPath)

        if let cellObject = item as? CollectionCellObject {
            reuseIdentifier = cellObject.reuseIdentifier
            item = cellObject.item
            tableView.register(cellObject.cellClass, forCellReuseIdentifier: cellObject.reuseIdentifier)
        }

        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier!, for: indexPath)

        if let collectionCell = cell as? CollectionCell {
            collectionCell.item = item
        }

        return cell
    }

    open func configureTableViewLayoutConstraints() {
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
    }
}

extension TableController : CollectionViewModelDelegate {
    
    open func modelDidChanged(_ model: CollectionViewModel) {
        self.tableView.reloadData()
    }
    
    open func modelWillChangeContent(_ model: CollectionViewModel) {
        self.tableView.beginUpdates()
    }
    
    open func model(_ model: CollectionViewModel, didChangeSectionAtIndex sectionIndex: Int, forChangeType type: Int) {
        switch type {
        case CollectionsChangeType.insert.rawValue:
            self.tableView.insertSections(IndexSet(integer: sectionIndex), with: .automatic)
        case CollectionsChangeType.update.rawValue:
            self.tableView.reloadSections(IndexSet(integer: sectionIndex), with: .automatic)
        case CollectionsChangeType.delete.rawValue:
            self.tableView.reloadSections(IndexSet(integer: sectionIndex), with: .automatic)
        default:
            break
        }
    }
    
    open func model(_ model: CollectionViewModel, didChangeObject object: Any, atIndexPath indexPath: IndexPath, forChangeType type: Int, newIndexPath: IndexPath) {
        switch type {
        case CollectionsChangeType.insert.rawValue:
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        case CollectionsChangeType.update.rawValue:
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        case CollectionsChangeType.delete.rawValue:
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        case CollectionsChangeType.move.rawValue:
            if indexPath != newIndexPath {
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                self.tableView.insertRows(at: [newIndexPath], with: .automatic)
           }
        default:
            break
        }
    }
    
    open func modelDidChangeContent(_ model: CollectionViewModel) {
        self.tableView.endUpdates()
    }
}
