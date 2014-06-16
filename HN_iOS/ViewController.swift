//
//  ViewController.swift
//  HN_iOS
//
//  Created by Jay Deuskar on 6/15/14.
//  Copyright (c) 2014 Jay Deuskar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HNAPIProtocol, UITableViewDelegate, UITableViewDataSource {
    
    var api: HNAPI = HNAPI()
    var stories: NSMutableArray = NSMutableArray()
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        api.delegate = self
        api.getArticles()
        
    }
    
    //UITableViewDataSource 
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        
        var story = stories[indexPath.row] as NSDictionary
        println(story)
        var title = story.objectForKey("title") as NSString
        var author = story.objectForKey("postedBy") as NSString
        cell.text = title
        cell.detailTextLabel.text = author 
        
        return cell
    }
    
    //delegate method
    func didRecieveResponse(results: NSDictionary) {
        stories = results["items"] as NSMutableArray
        table.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

