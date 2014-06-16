//
//  ViewController.swift
//  HN_iOS
//
//  Created by Jay Deuskar on 6/15/14.
//  Copyright (c) 2014 Jay Deuskar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HNAPIProtocol {
    
    var api: HNAPI = HNAPI()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        api.delegate = self
        api.getArticles()
        
    }
    
    //delegate method
    func didRecieveResponse(results: NSDictionary) {
        println(results["items"])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

