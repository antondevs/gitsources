//
//  BrowserDirInteractor.swift
//  Git Sources
//
//  Created Anton Nadtoka on 09/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//
//  Viper Swift Template
//

protocol BrowserDirInteractorOutput: class {
    
}

protocol BrowserDirInteractorInput: class {
    func fetchDirContent(context:BrowseContext, completion:@escaping ([ContentItem] , Error?) -> ())
}

final class BrowserDirInteractor: BrowserDirInteractorInput {

    weak var presenter: BrowserDirInteractorOutput!
	
    var apiLayer: ApiProtocol!
    
    func fetchDirContent(context:BrowseContext, completion:@escaping ([ContentItem] , Error?) -> ())  {
        apiLayer.fetchDirContent(context: context) { (result, error) in
            completion(result, error)
        }
    }

}

