//
//  BrowserDirAssembler.swift
//  Git Sources
//
//  Created Anton Nadtoka on 09/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

import Swinject
import SwinjectStoryboard

final class BrowserDirAssemblyContainer: Assembly {
    
    func assemble(container: Container) {
        container.register(BrowserDirInteractor.self) { (r, presenter: BrowserDirPresenter) in
            let interactor = BrowserDirInteractor()
            interactor.presenter = presenter
            interactor.apiLayer = r.resolve(ApiProtocol.self)
            return interactor
        }
        
        container.register(BrowserDirRouter.self) { (r, view: BrowserDirView) in
            let router = BrowserDirRouter()
            router.transitionHandler = view
            
            return router
        }
        
        container.register(BrowserDirPresenter.self) { (r, view: BrowserDirView) in
            let presenter = BrowserDirPresenter()
            presenter.view = view
            presenter.interactor = r.resolve(BrowserDirInteractor.self, argument: presenter)
            presenter.router = r.resolve(BrowserDirRouter.self, argument: view)
            
            return presenter
        }
        
        container.storyboardInitCompleted(BrowserDirView.self) { r, view in
            view.presenter = r.resolve(BrowserDirPresenter.self, argument: view)
        }
    }
}
