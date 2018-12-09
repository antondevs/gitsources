//
//  RepositoryListInteractor.swift
//  Git Sources
//
//  Created Anton Nadtoka on 08/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

protocol RepositoryListInteractorOutput: class {
    
}

protocol RepositoryListInteractorInput: class {
   func searchRepositories(pageIndex:Int, pageSize:Int, completion:@escaping (RepositoryResult? , Error?) -> ())
}

final class RepositoryListInteractor: RepositoryListInteractorInput {

    weak var presenter: RepositoryListInteractorOutput!
	var apiLayer: ApiProtocol!
    
    func searchRepositories(pageIndex:Int, pageSize:Int, completion:@escaping (RepositoryResult? , Error?) -> ()) {
        apiLayer.searchRepositories(pageIndex: pageIndex, pageSize: pageSize) { (result, error) in
            completion(result, error)
        }
    }
}

