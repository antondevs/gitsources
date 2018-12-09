//
//  RepositoryListRouter.swift
//  Git Sources
//
//  Created Anton Nadtoka on 08/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import LightRoute

protocol RepositoryListRouterInput: class {
    func openBack()
    func openRepository(context:BrowseContext)
}

final class RepositoryListRouter: RepositoryListRouterInput {
    
    weak var transitionHandler: TransitionHandler!
    
    func openRepository(context:BrowseContext) {
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
