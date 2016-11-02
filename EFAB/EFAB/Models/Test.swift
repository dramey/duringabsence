//
//  Test.swift
//  EFAB
//
//  Created by Deb Ramey on 10/31/16.
//  Copyright © 2016 Deb Ramey. All rights reserved.
//

import Foundation
import Alamofire
import Freddy

class Test: NetworkModel{
    //properties we get from http://jsonplaceholder.typicode.com/posts
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    
    //request type--this will allow us to get one post-many posts and also create one--change in method as well
    enum RequestType{
        case getPost
        case getPosts
        case createPost
    }
    
    //create var with enum above
    var requestType = RequestType.getPost
    
    //empty constructor//you need this because of the one below
    required init(){}
    
    //create an object from JSON
    required init (json: JSON) throws{
        userId = try? json.getInt(at: Constants.Test.userId)
        id = try? json.getInt(at: Constants.Test.id)
        title = try? json.getString(at: Constants.Test.title)
        body = try? json.getString(at: Constants.Test.body)
    }
    //always return HTTP.GET
    func method() -> Alamofire.HTTPMethod{
        //using the enum and the var
        switch requestType {
        case .getPost, .getPosts:
            return .get
        default:
            return .post
        }
        return .get
    }
    
    //a sample path to a single post
    func path() -> String{
        //hard coded to just one post
        //return "/posts/4"
        switch requestType {
        case .getPost:
            return "/posts/1"
        case .getPosts:
            return "/posts"
        case .createPost:
            return "/posts"
        }

        
    }
    //demo object is not being posted to server, so just throw nil
    func toDictionary() -> [String: AnyObject]?{
        //return nil    updated to below after enum and var implemented
        
        switch requestType {
        case .createPost:
            var params: [String: AnyObject] = [:]
            
            params[Constants.Test.userId] = userId as AnyObject?? ?? 0 as AnyObject?
            params[Constants.Test.title] = title as AnyObject?? ?? "" as AnyObject?
            params[Constants.Test.body] = body as AnyObject?? ?? "" as AnyObject?
            
            return params
        default:
            return nil
        }
    }
    //helper function to print things out- debugging
    func description() -> String{
        var text = ""
        text += "title: \(title ?? "")\n"
        text += "body: \(body ?? "")\n"
        return text
    }
}
