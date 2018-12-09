//
//  WebPageRouter.swift
//  Git Sources
//
//  Created Anton Nadtoka on 09/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

import LightRoute

protocol WebPageRouterInput: class {
    func openNext()
    func openBack()
}

final class WebPageRouter: WebPageRouterInput {
    
    weak var transitionHandler: TransitionHandler!
    
    func openNext() {
        //  let storyboard = UIStoryboard(name: "{NAME}", bundle: Bundle.main)
        //  let factory = StoryboardFactory(storyboard: storyboard)
        //  
        //  try? transitionHandler
        //     .forStoryboard(factory: factory, to: {NAME}View.self)
        //      .transition(animate: false)
        //      .then { moduleInput in
        //          moduleInput.configure()
        //  }
    }
    
    func openBack() {
        try? transitionHandler
            .closeCurrentModule()
            .perform()
    }
    
}
