//
//  RepositoryListView.swift
//  Git Sources
//
//  Created Anton Nadtoka on 08/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import UIKit

protocol RepositoryListModuleInput: class {
    func configure()
}

protocol RepositoryListViewInput: class {
    func showItems(items:[Item])
}

protocol RepositoryListViewOutput: class {
    func viewIsReady()
    func loadMore()
    func openRepository(item:Item)
}

final class RepositoryListView: UIViewController, RepositoryListViewInput {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: RepositoryListViewOutput!
    var items:[Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barAppearace = UIBarButtonItem.appearance()
        barAppearace.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: -60), for:UIBarMetrics.default)
        
        setupTableView()
        
        self.presenter.viewIsReady()
    }
    
    func setupTableView() {
        let nib = UINib(nibName: "RepositoryCell", bundle: nil)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nib, forCellReuseIdentifier: "CELL")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }

    func showItems(items:[Item]) {
        self.items = items
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension RepositoryListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CELL",
                        for: indexPath) as? RepositoryCell else { return UITableViewCell() }
        
        cell.setupData(item: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
            let spinner = UIActivityIndicatorView(style: .gray)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
            tableView.tableFooterView = spinner
            tableView.tableFooterView?.isHidden = false
            
            self.presenter.loadMore()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.openRepository(item: items[indexPath.row])
    }
    
}

extension RepositoryListView: RepositoryListModuleInput {
    func configure() {        
        
    }
}
