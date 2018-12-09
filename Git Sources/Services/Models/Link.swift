//
//  Link.swift
//  Git Sources
//
//  Created by Anton Nadtoka on 09/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import Foundation
import ObjectMapper

class Link : Mappable {
    
    var git : String?
    var html : String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map)
    {
        git <- map["git"]
        html <- map["html"]
    }
    
}
