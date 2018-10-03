//
//  TableController.swift
//  Collections
//
//  Created by Tayphoon on 14/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import UIKit

/**
 AbstractTableController used to fix capability objc protocols with generic classes.
 */
open class AbstractTableController: UIViewController, UITableViewDataSource {
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        fatalError("Subclasses need to implement the `numberOfSections(tableView:)` method.")
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fatalError("Subclasses need to implement the `tableView(tableView:, numberOfRowsInSection:)` method.")
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("Subclasses need to implement the `tableView(tableView:, cellForRowAt:)` method.")
    }
}

open class TableController<T>: AbstractTableController where T: TableViewModel  {

    private var _tableView: UITableView?

    open var tableView: UITableView {
        get {
            if(_tableView == nil) {
                let tableView = UITableView()
                tableView.translatesAutoresizingMaskIntoConstraints = false
                _tableView = tableView
                
                view.addSubview(tableView)
                configureTableViewLayoutConstraints()
            }
            
            return _tableView!
        }
    }
    
    open var viewModel: T! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }

    open override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }

    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item = viewModel.itemAtIndexPath(indexPath)
        var reuseIdentifier = viewModel.reuseIdentifierForCellAtIndexPath(indexPath)

        if let cellObject = item as? CollectionCellObject {
            reuseIdentifier = cellObject.reuseIdentifier
            item = cellObject.item
            tableView.register(cellObject.cellClass, forCellReuseIdentifier: cellObject.reuseIdentifier)
        }

        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        if let collectionCell = cell as? CollectionCell, let item = item {
            collectionCell.configure(with: item)
        }

        return cell
    }

    open func viewForHeaderInTable(_ tableView: UITableView, section: Int) -> UIView? {
        guard let sectionObject = viewModel.item(for: section) as? CollectionSectionObject,
            let headerObject = sectionObject.footerObject else {
                return nil
        }

        tableView.register(headerObject.supplementaryViewClass, forHeaderFooterViewReuseIdentifier: headerObject.reuseIdentifier)

        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerObject.reuseIdentifier)

        if let headerView = headerView as? SectionHeaderFooterView, let item = headerObject.item  {
            headerView.configure(with: item)
        }

        return headerView
    }

    open func viewForFooterInTable(_ tableView: UITableView, section: Int) -> UIView? {
        guard let sectionObject = viewModel.item(for: section) as? CollectionSectionObject,
              let footerObject = sectionObject.footerObject else {
            return nil
        }

        tableView.register(footerObject.supplementaryViewClass, forHeaderFooterViewReuseIdentifier: footerObject.reuseIdentifier)

        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerObject.reuseIdentifier)

        if let footerView = footerView as? SectionHeaderFooterView, let item = footerObject.item  {
            footerView.configure(with: item)
        }

        return footerView
    }

    open func configureTableViewLayoutConstraints() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension TableController: TableViewModelDelegate {
    
    open func modelDidChanged(_ model: CollectionViewModel) {
        tableView.reloadData()
    }
    
    open func modelWillChangeContent(_ model: CollectionViewModel) {
        tableView.beginUpdates()
    }
    
    open func model(_ model: CollectionViewModel, didChangeSectionAtIndex sectionIndex: Int, forChangeType type: Int) {
        switch type {
        case CollectionsChangeType.insert.rawValue:
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .automatic)
        case CollectionsChangeType.update.rawValue:
            tableView.reloadSections(IndexSet(integer: sectionIndex), with: .automatic)
        case CollectionsChangeType.delete.rawValue:
            tableView.reloadSections(IndexSet(integer: sectionIndex), with: .automatic)
        default:
            break
        }
    }
    
    open func model(_ model: CollectionViewModel, didChangeObject object: Any, atIndexPath indexPath: IndexPath, forChangeType type: Int, newIndexPath: IndexPath) {
        switch type {
        case CollectionsChangeType.insert.rawValue:
            tableView.insertRows(at: [indexPath], with: .automatic)
        case CollectionsChangeType.update.rawValue:
            tableView.reloadRows(at: [indexPath], with: .automatic)
        case CollectionsChangeType.delete.rawValue:
            tableView.deleteRows(at: [indexPath], with: .automatic)
        case CollectionsChangeType.move.rawValue:
            if indexPath != newIndexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
           }
        default:
            break
        }
    }
    
    open func modelDidChangeContent(_ model: CollectionViewModel) {
        tableView.endUpdates()
    }
}
