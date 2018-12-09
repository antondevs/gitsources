//
//  Owner.swift
//  GitStars
//
//  Created by Anton Nadtoka on 05/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import Foundation
import ObjectMapper

class Owner: Mappable {
    
    var login: String?
    var id: Int?
    var nodeId: String?
    var avatarUrl: String?
    var gravatarId: String?
    var url: String?
    var htmlUrl: String?
    var followersUrl: String?
    var followingUrl: String?
    var gistsUrl: String?
    var starredUrl: String?
    var subscriptionsUrl: String?
    var organizationsUrl: String?
    var reposUrl: String?
    var eventsUrl: String?
    var receivedEventsUrl: String?
    var type: String?
    var siteAdmin: Bool?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        login <- map["login"]
        id <- map["id"]
        nodeId <- map["node_id"]
        avatarUrl <- map["avatar_url"]
        gravatarId <- map["gravatar_id"]
        url <- map["url"]
        htmlUrl <- map["html_url"]
        followersUrl <- map["followers_url"]
        followingUrl <- map["following_url"]
        gistsUrl <- map["gists_url"]
        starredUrl <- map["starred_url"]
        subscriptionsUrl <- map["subscriptions_url"]
        organizationsUrl <- map["organizations_url"]
        reposUrl  <- map["repos_url"]
        eventsUrl  <- map["events_url"]
        receivedEventsUrl <- map["received_events_url"]
        type <- map["type"]
        siteAdmin <- map["site_admin"]
    }
    
}
