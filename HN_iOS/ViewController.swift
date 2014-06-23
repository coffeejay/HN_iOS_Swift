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
    @IBOutlet var stories_table: UITableView!

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
        
        
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: nil)
        
        
        var story = stories[indexPath.row] as NSDictionary
        println(story)
        var title = story.objectForKey("title") as NSString
        var author = story.objectForKey("postedBy") as NSString
        
        cell.text = title
        cell.detailTextLabel.text = author
        
        cell.textLabel.font = UIFont(name: "Arial", size: 14.0)
        cell.textLabel.numberOfLines = 3

        
        return cell
    }
    
    //tableview delegate methods
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        var story = stories[indexPath.row] as NSDictionary
        var url = story.objectForKey("url") as NSString
        let secondViewController:HNWebViewController = HNWebViewController(nibName: "HNWebViewController", bundle: nil)
        secondViewController.url_to_load = url
        self.presentViewController(secondViewController, animated: true, completion: nil)
    }
    
    //delegate method
    func didRecieveResponse(results: NSDictionary) {
        stories = results["items"] as NSMutableArray
        stories_table.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

