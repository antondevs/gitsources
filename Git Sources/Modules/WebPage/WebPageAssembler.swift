//
//  WebPageAssembler.swift
//  Git Sources
//
//  Created Anton Nadtoka on 09/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

import Swinject
import SwinjectStoryboard

final class WebPageAssemblyContainer: Assembly {
    
    func assemble(container: Container) {
        container.register(WebPageInteractor.self) { (r, presenter: WebPagePresenter) in
            let interactor = WebPageInteractor()
            interactor.presenter = presenter
            
            // Inject API
            // interactor.apiLayer = r.resolve(ApiProtocol.self) 

            return interactor
        }
        
        container.register(WebPageRouter.self) { (r, view: WebPageView) in
            let router = WebPageRouter()
            router.transitionHandler = view
            
            return router
        }
        
        container.register(WebPagePresenter.self) { (r, view: WebPageView) in
            let presenter = WebPagePresenter()
            presenter.view = view
            presenter.interactor = r.resolve(WebPageInteractor.self, argument: presenter)
            presenter.router = r.resolve(WebPageRouter.self, argument: view)
            
            return presenter
        }
        
        container.storyboardInitCompleted(WebPageView.self) { r, view in
            view.presenter = r.resolve(WebPagePresenter.self, argument: view)
        }
    }
}
