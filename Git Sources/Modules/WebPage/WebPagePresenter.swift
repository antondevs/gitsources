//
//  WebPagePresenter.swift
//  Git Sources
//
//  Created Anton Nadtoka on 09/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

import Foundation

final class WebPagePresenter: WebPageViewOutput {
    
    weak var view: WebPageViewInput!
    var interactor: WebPageInteractorInput!
    var router: WebPageRouterInput!

    init() {
        #if DEBUG
            print("WebPagePresenter init()")
        #endif
    }
    

    
}

extension WebPagePresenter: WebPageInteractorOutput {
    
}
