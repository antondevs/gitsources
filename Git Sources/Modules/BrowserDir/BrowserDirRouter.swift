//
//  BrowserDirRouter.swift
//  Git Sources
//
//  Created Anton Nadtoka on 09/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

import LightRoute

protocol BrowserDirRouterInput: class {
    func openBack()
    func openPage(pageUrl:String)
    func openDirectory(context:BrowseContext)
}

final class BrowserDirRouter: BrowserDirRouterInput {
    
    weak var transitionHandler: TransitionHandler!
    
    func openPage(pageUrl:String) {
        let storyboard = UIStoryboard(name: "WebPage", bundle: Bundle.main)
        let factory = StoryboardFactory(storyboard: storyboard)
        
        try? transitionHandler
            .forStoryboard(factory: factory, to: WebPageView.self)
            .transition(animate: true)
            .to(preferred: .navigation(style: .push))
            .apply(to: { controller in
                
            })
            .then { moduleInput in
                moduleInput.configure(pageUrl: pageUrl)
        }
    }
    
    func openDirectory(context:BrowseContext) {
        let storyboard = UIStoryboard(name: "BrowserDir", bundle: Bundle.main)
        let factory = StoryboardFactory(storyboard: storyboard)
        
        try? transitionHandler
            .forStoryboard(factory: factory, to: BrowserDirView.self)
            .transition(animate: true)
            .to(preferred: .navigation(style: .push))
            .apply(to: { controller in
                
            })
            .then { moduleInput in
                moduleInput.configure(browseContext: context)
        }
    }
    
    func openBack() {
        try? transitionHandler
            .closeCurrentModule()
            .perform()
    }
    
}
