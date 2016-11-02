//
//  ViewController.swift
//  EFAB
//
//  Created by Deb Ramey on 10/31/16.
//  Copyright © 2016 Deb Ramey. All rights reserved.
//

import UIKit
import Alamofire
import Freddy

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let test = Test()
        
        //print("starting call")
        WebServices.shared.getObject(test) { (object, error) in
            //print("call returned")
            
            if let object = object {
                print(object.description())
                
            }else {
                print(error ?? Constants.JSON.unknownError)
            }
        }
        //print("call made")
        //get many posts
        let getPostsTest = Test()
        //what we want to do when we get a web request
        getPostsTest.requestType = .getPosts
        
        WebServices.shared.getObjects(getPostsTest) { (objects, error) in
            if let objects = objects{
                print("got \(objects.count) items")
            } else {
                print("get posts failed")
            }
        }
        
        
            }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

