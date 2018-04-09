//
//  TableController.swift
//  Collections
//
//  Created by Tayphoon on 14/01/2018.
//  Copyright © 2018 Tayphoon. All rights reserved.
//

import UIKit

open class TableController: UIViewController {
    private var _tableView: UITableView?

    public var tableView: UITableView {
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
    
    public var viewModel: TableViewModel? {
        willSet {
            self.viewModel?.delegate = self
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    internal func configureTableViewLayoutConstraints() {
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
    }
}

extension TableController : UITableViewDataSource, UITableViewDelegate {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel?.numberOfSections() ?? 0
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.numberOfItemsInSection(section) ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item = self.viewModel?.itemAtIndexPath(indexPath)
        var reuseIdentifier = self.viewModel?.reuseIdentifierForCellAtIndexPath(indexPath)
        
        if let cellObject = item as? CollectionCellObject {
            reuseIdentifier = cellObject.reuseIdentifier
            item = cellObject.item
            tableView.register(cellObject.cellClass, forCellReuseIdentifier: cellObject.reuseIdentifier)
        }
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier!, for: indexPath)
        
        if var collectionCell = cell as? CollectionCell {
            collectionCell.item = item
        }
        
        return cell
    }
}

extension TableController : CollectionViewModelDelegate {
    
    public func modelDidChanged(_ model: CollectionViewModel) {
        self.tableView.reloadData()
    }
    
    public func modelWillChangeContent(_ model: CollectionViewModel) {
        self.tableView.beginUpdates()
    }
    
    public func model(_ model: CollectionViewModel, didChangeSectionAtIndex sectionIndex: Int, forChangeType type: Int) {
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
    
    public func model(_ model: CollectionViewModel, didChangeObject object: Any, atIndexPath indexPath: IndexPath, forChangeType type: Int, newIndexPath: IndexPath) {
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
    
    public func modelDidChangeContent(_ model: CollectionViewModel) {
        self.tableView.endUpdates()
    }
}
