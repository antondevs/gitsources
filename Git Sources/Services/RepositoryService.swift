//
//  RepositoryService.swift
//  Git Sources
//
//  Created by Anton Nadtoka on 08/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import Alamofire
import ObjectMapper

extension ApiService {
    
    func fetchDirContent(context:BrowseContext, completion:@escaping ([ContentItem] , Error?) -> ()) {
        print("\(EndPoint.githubApi)/repos/\(context.owner)/\(context.repo)/contents\(context.path)")
        Alamofire.request("\(EndPoint.githubApi)/repos/\(context.owner)/\(context.repo)/contents\(context.path)")
            .responseJSON { response  in
                
                switch response.result {
                case .success(let data):
                    
                    if let responseJSON = data as? [[String: AnyObject]] {
                        
                        print(responseJSON)
                        
                        let result:[ContentItem] = Mapper<ContentItem>().mapArray(JSONArray: responseJSON)
                        completion(result, nil)
                    }
                    else {
                        completion([], nil)
                    }
                    
                case .failure(let error):
                    completion([], error)
                }
        }
    }
    
    func searchRepositories(pageIndex:Int, pageSize:Int, completion:@escaping (RepositoryResult? , Error?) -> ()) {
        
        Alamofire.request("\(EndPoint.githubApi)/search/repositories?q=iOS&l=Swift&sort=stars&order=desc&page=\(pageIndex)&per_page=\(pageSize)")
            .responseJSON { response  in
                
                switch response.result {
                case .success(let data):
                    
                    if let responseJSON = data as? [String: AnyObject] {
                        
                        guard let result:RepositoryResult = Mapper<RepositoryResult>().map(JSON: responseJSON) else {
                            completion(nil, nil)
                            return
                        }
                        
                        completion(result, nil)
                    }
                    else {
                        completion(nil, nil)
                    }
                    
                case .failure(let error):
                    completion(nil, error)
                }
        }
    }
    
}

