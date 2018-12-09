//
//  RepositoryListPresenter.swift
//  Git Sources
//
//  Created Anton Nadtoka on 08/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import Foundation

final class RepositoryListPresenter: RepositoryListViewOutput {
    
    weak var view: RepositoryListViewInput!
    var interactor: RepositoryListInteractorInput!
    var router: RepositoryListRouterInput!
    
    var pageIndex:Int = 1
    var items:[Item] = []

    init() {
        #if DEBUG
            print("RepositoryListPresenter init()")
        #endif
    }
    
    func loadNextRepositories() {
        self.interactor.searchRepositories(pageIndex: pageIndex, pageSize: 10) { (result, error) in
            if error != nil {
                print("Failed loading repositories")
            }
            else if result != nil {
                if let itemsList = result?.items {
                    self.items.append(contentsOf: itemsList)
                    self.pageIndex = self.pageIndex + 1
                    self.view.showItems(items: self.items)
                }
                else {
                    self.view.showItems(items: self.items)
                }
            }
        }
    }
    
    func loadMore() {
        loadNextRepositories()
    }
    
    func viewIsReady() {
        loadNextRepositories()
    }
    
    func openRepository(item:Item) {
        guard let owner = item.owner else { return }
        
        var context = BrowseContext()
        context.owner = owner.login ?? ""
        context.path = "/"
        context.repo = item.name ?? ""
        
        self.router.openRepository(context: context)
    }
    
}

extension RepositoryListPresenter: RepositoryListInteractorOutput {
    
}
