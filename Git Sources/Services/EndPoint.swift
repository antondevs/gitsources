//
//  EndPoint.swift
//  Git Sources
//
//  Created by Anton Nadtoka on 08/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import Foundation

struct EndPoint {
    
    #if DEBUG
    // Debug environment
    
    static let githubApi = "https://api.github.com"
    
    #else
    // Release environment
    
    static let githubApi = "https://api.github.com"
    
    #endif
    
}
