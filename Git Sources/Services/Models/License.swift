//
//  License.swift
//  GitStars
//
//  Created by Anton Nadtoka on 05/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import Foundation
import ObjectMapper

class License: Mappable {
    
    var key: String?
    var name: String?
    var spdxId: String?
    var url: Any?
    var nodeId: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        key <- map["key"]
        name  <- map["name"]
        spdxId <- map["spdx_id"]
        url <- map["url"]
        nodeId <- map["node_id"]
    }
    
}
