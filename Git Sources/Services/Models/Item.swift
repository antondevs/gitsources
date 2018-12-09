//
//  Item.swift
//  GitStars
//
//  Created by Anton Nadtoka on 05/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import Foundation
import ObjectMapper

class Item: Mappable {
    
    var id: Int?
    var nodeId: String?
    var name: String?
    var fullName: String?
    var privateField: Bool?
    var owner: Owner?
    var htmlUrl: String?
    var description: String?
    var fork: Bool?
    var url: String?
    var forksUrl: String?
    var keysUrl: String?
    var collaboratorsUrl: String?
    var teamsUrl: String?
    var hooksUrl: String?
    var issueEventsUrl: String?
    var eventsUrl: String?
    var assigneesUrl: String?
    var branchesUrl: String?
    var tagsUrl: String?
    var blobsUrl: String?
    var gitTagsUrl: String?
    var gitRefsUrl: String?
    var treesUrl: String?
    var statusesUrl: String?
    var languagesUrl: String?
    var stargazersUrl: String?
    var contributorsUrl: String?
    var subscribersUrl: String?
    var subscriptionUrl: String?
    var commitsUrl: String?
    var gitCommitsUrl: String?
    var commentsUrl: String?
    var issueCommentUrl: String?
    var contentsUrl: String?
    var compareUrl: String?
    var mergesUrl: String?
    var archiveUrl: String?
    var downloadsUrl: String?
    var issuesUrl: String?
    var pullsUrl: String?
    var milestonesUrl: String?
    var notificationsUrl: String?
    var labelsUrl: String?
    var releasesUrl: String?
    var deploymentsUrl: String?
    var createdAt: String?
    var updatedAt: String?
    var pushedAt: String?
    var gitUrl: String?
    var sshUrl: String?
    var cloneUrl: String?
    var svnUrl: String?
    var homepage: String?
    var size: Int?
    var stargazersCount: Int?
    var watchersCount: Int?
    var language: String?
    var hasIssues: Bool?
    var hasProjects: Bool?
    var hasDownloads: Bool?
    var hasWiki: Bool?
    var hasPages: Bool?
    var forksCount: Int?
    var mirrorUrl: Any?
    var archived: Bool?
    var openIssuesCount: Int?
    var license: License?
    var forks: Int?
    var openIssues: Int?
    var watchers: Int?
    var defaultBranch: String?
    var score: Double?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        nodeId <- map["node_id"]
        name <- map["name"]
        fullName <- map["full_name"]
        privateField <- map["private"]
        owner <- map["owner"]
        htmlUrl <- map["html_url"]
        description <- map["description"]
        fork <- map["fork"]
        url <- map["url"]
        forksUrl <- map["forks_url"]
        keysUrl <- map["keys_url"]
        collaboratorsUrl <- map["collaborators_url"]
        teamsUrl <- map["teams_url"]
        hooksUrl <- map["hooks_url"]
        issueEventsUrl <- map["issue_events_url"]
        eventsUrl <- map["events_url"]
        assigneesUrl <- map["assignees_url"]
        branchesUrl <- map["branches_url"]
        tagsUrl <- map["tags_url"]
        blobsUrl <- map["blobs_url"]
        gitTagsUrl <- map["git_tags_url"]
        gitRefsUrl <- map["git_refs_url"]
        treesUrl <- map["trees_url"]
        statusesUrl <- map["statuses_url"]
        languagesUrl <- map["languages_url"]
        stargazersUrl <- map["stargazers_url"]
        contributorsUrl <- map["contributors_url"]
        subscribersUrl <- map["subscribers_url"]
        subscriptionUrl <- map["subscription_url"]
        commitsUrl <- map["commits_url"]
        gitCommitsUrl <- map["git_commits_url"]
        commentsUrl <- map["comments_url"]
        issueCommentUrl <- map["issue_comment_url"]
        contentsUrl <- map["contents_url"]
        compareUrl <- map["compare_url"]
        mergesUrl <- map["merges_url"]
        archiveUrl <- map["archive_url"]
        downloadsUrl <- map["downloads_url"]
        issuesUrl <- map["issues_url"]
        pullsUrl <- map["pulls_url"]
        milestonesUrl <- map["milestones_url"]
        notificationsUrl <- map["notifications_url"]
        labelsUrl <- map["labels_url"]
        releasesUrl <- map["releases_url"]
        deploymentsUrl <- map["deployments_url"]
        createdAt <- map["created_at"]
        updatedAt <- map["updated_at"]
        pushedAt <- map["pushed_at"]
        gitUrl <- map["git_url"]
        sshUrl <- map["ssh_url"]
        cloneUrl <- map["clone_url"]
        svnUrl <- map["svn_url"]
        homepage <- map["homepage"]
        size <- map["size"]
        stargazersCount <- map["stargazers_count"]
        watchersCount <- map["watchers_count"]
        language <- map["language"]
        hasIssues <- map["has_issues"]
        hasProjects <- map["has_projects"]
        hasDownloads <- map["has_downloads"]
        hasWiki <- map["has_wiki"]
        hasPages <- map["has_pages"]
        forksCount <- map["forks_count"]
        mirrorUrl <- map["mirror_url"]
        archived <- map["archived"]
        openIssuesCount <- map["open_issues_count"]
        license <- map["license"]
        forks <- map["forks"]
        openIssues <- map["open_issues"]
        watchers <- map["watchers"]
        defaultBranch <- map["default_branch"]
        score <- map["score"]
    }
    
}
