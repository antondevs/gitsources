//
//  ApiProtocol.swift
//  Git Sources
//
//  Created by Anton Nadtoka on 08/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import Foundation

protocol ApiProtocol {
    
    // Repository service
    
    func searchRepositories(pageIndex:Int, pageSize:Int, completion:@escaping (RepositoryResult? , Error?) -> ())
    func fetchDirContent(context:BrowseContext, completion:@escaping ([ContentItem] , Error?) -> ())
    
}

class ApiService : ApiProtocol {
    // Common code and variables
    // ...
}
