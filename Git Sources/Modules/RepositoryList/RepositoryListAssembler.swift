//
//  RepositoryListAssembler.swift
//  Git Sources
//
//  Created Anton Nadtoka on 08/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import Swinject
import SwinjectStoryboard

final class RepositoryListAssemblyContainer: Assembly {
    
    func assemble(container: Container) {
        container.register(RepositoryListInteractor.self) { (r, presenter: RepositoryListPresenter) in
            let interactor = RepositoryListInteractor()
            interactor.presenter = presenter
            interactor.apiLayer = r.resolve(ApiProtocol.self)
            return interactor
        }
        
        container.register(RepositoryListRouter.self) { (r, view: RepositoryListView) in
            let router = RepositoryListRouter()
            router.transitionHandler = view
            return router
        }
        
        container.register(RepositoryListPresenter.self) { (r, view: RepositoryListView) in
            let presenter = RepositoryListPresenter()
            presenter.view = view
            presenter.interactor = r.resolve(RepositoryListInteractor.self, argument: presenter)
            presenter.router = r.resolve(RepositoryListRouter.self, argument: view)
            
            return presenter
        }
        
        container.storyboardInitCompleted(RepositoryListView.self) { r, view in
            view.presenter = r.resolve(RepositoryListPresenter.self, argument: view)
        }
    }
}
