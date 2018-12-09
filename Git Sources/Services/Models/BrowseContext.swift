//
//  BrowseContext.swift
//  Git Sources
//
//  Created by Anton Nadtoka on 09/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import Foundation

struct BrowseContext {
    var owner:String
    var repo:String
    var path:String
    var parent:String
    
    init() {
        owner = ""
        repo = ""
        path = ""
        parent = ""
    }
}
