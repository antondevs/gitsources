//
//  BrowserDirView.swift
//  Git Sources
//
//  Created Anton Nadtoka on 09/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

import UIKit

protocol BrowserDirModuleInput: class {
    func configure(browseContext:BrowseContext)
}

protocol BrowserDirViewInput: class {
    func showItems(items:[ContentItem])
}

protocol BrowserDirViewOutput: class {
    func openPage(pageUrl:String)
    func fetchContent(context:BrowseContext)
    func openDirectory(context:BrowseContext)
}

final class BrowserDirView: UIViewController, BrowserDirViewInput {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: BrowserDirViewOutput!
    var browseContext:BrowseContext = BrowseContext()
    var items:[ContentItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        self.presenter.fetchContent(context: browseContext)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = browseContext.path == "/" ? "Root" : browseContext.parent
    }
    
    func setupTableView() {
        let nib = UINib(nibName: "ContentItemCell", bundle: nil)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nib, forCellReuseIdentifier: "CELL")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    func showItems(items:[ContentItem]) {
        self.items = items.sorted { $0.type ?? "" < $1.type ?? "" }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

extension BrowserDirView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CELL",
                                                       for: indexPath) as? ContentItemCell else { return UITableViewCell() }
        
        cell.setupData(item: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        
        if let type = item.type {
            if type == "dir" {
                if let name = item.name {
                    var context:BrowseContext = browseContext
                    context.parent = name
                    context.path = context.path + "/\(name)"
                    self.presenter.openDirectory(context: context)
                }
            }
            else if type == "file" {
                if let url = item.htmlUrl {
                    self.presenter.openPage(pageUrl: url)
                }
            }
        }
    }
}

extension BrowserDirView: BrowserDirModuleInput {
    func configure(browseContext:BrowseContext) {
        self.browseContext = browseContext
    }
}
