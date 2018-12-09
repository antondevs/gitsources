//
//  ContentItem.swift
//  Git Sources
//
//  Created by Anton Nadtoka on 09/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import Foundation
import ObjectMapper

class ContentItem : Mappable{
    
    var links : Link?
    var downloadUrl : AnyObject?
    var gitUrl : String?
    var htmlUrl : String?
    var name : String?
    var path : String?
    var sha : String?
    var size : Int?
    var type : String?
    var url : String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map)
    {
        links <- map["_links"]
        downloadUrl <- map["download_url"]
        gitUrl <- map["git_url"]
        htmlUrl <- map["html_url"]
        name <- map["name"]
        path <- map["path"]
        sha <- map["sha"]
        size <- map["size"]
        type <- map["type"]
        url <- map["url"]
    }

}
