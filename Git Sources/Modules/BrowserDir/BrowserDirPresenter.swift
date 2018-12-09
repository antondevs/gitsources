//
//  BrowserDirPresenter.swift
//  Git Sources
//
//  Created Anton Nadtoka on 09/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

import Foundation

final class BrowserDirPresenter: BrowserDirViewOutput {
    
    weak var view: BrowserDirViewInput!
    var interactor: BrowserDirInteractorInput!
    var router: BrowserDirRouterInput!
    
    var items:[ContentItem] = []

    init() {
        #if DEBUG
            print("BrowserDirPresenter init()")
        #endif
    }
    
    func fetchContent(context:BrowseContext) {
        self.interactor.fetchDirContent(context: context) { (result, error) in
            if error != nil {
                print("Error loading content of repository")
            }
            else {
                self.items = result
                self.view.showItems(items: self.items)
            }
        }
    }
    
    func openPage(pageUrl:String) {
        self.router.openPage(pageUrl: pageUrl)
    }
    
    func openDirectory(context:BrowseContext) {
        self.router.openDirectory(context: context)
    }
    
}

extension BrowserDirPresenter: BrowserDirInteractorOutput {
    
}
