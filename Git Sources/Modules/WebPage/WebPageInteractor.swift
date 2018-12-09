//
//  WebPageInteractor.swift
//  Git Sources
//
//  Created Anton Nadtoka on 09/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

protocol WebPageInteractorOutput: class {
    
}

protocol WebPageInteractorInput: class {
   
}

final class WebPageInteractor: WebPageInteractorInput {

    weak var presenter: WebPageInteractorOutput!

	// Inject API
	// var apiLayer: ApiProtocol!    

}

