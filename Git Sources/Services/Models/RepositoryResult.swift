//
//  Result.swift
//  GitStars
//
//  Created by Anton Nadtoka on 05/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import Foundation
import ObjectMapper

class RepositoryResult : Mappable {

    var totalCount: Int?
    var incompleteResults: Bool?
    var items: [Item]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        totalCount  <- map["total_count"]
        incompleteResults <- map["incomplete_results"]
        items <- map["items"]
    }
    
}
