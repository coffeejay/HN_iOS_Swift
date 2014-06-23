//
//  HNWebViewController.swift
//  HN_iOS
//
//  Created by Jay Deuskar on 6/16/14.
//  Copyright (c) 2014 Jay Deuskar. All rights reserved.
//

import UIKit

class HNWebViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    var url_to_load: NSString!
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var url = NSURL(string: url_to_load)
        var req = NSURLRequest(URL: url)
        webView.scalesPageToFit = true
        webView.loadRequest(req)
        
    }
    
    @IBAction func goBack(){
        self.dismissModalViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
