//
//  HNAPI.swift
//  HN_iOS
//
//  Created by Jay Deuskar on 6/15/14.
//  Copyright (c) 2014 Jay Deuskar. All rights reserved.
//

import UIKit

protocol HNAPIProtocol{
    func didRecieveResponse(results:NSDictionary)
}

class HNAPI: NSObject {
    
    var data: NSMutableData = NSMutableData()
    var delegate: HNAPIProtocol?
    
    func getArticles(){
        
        let endpoint = "http://api.ihackernews.com/page"
        
        var url:NSURL = NSURL(string: endpoint)
        var request:NSURLRequest = NSURLRequest(URL: url)
        var connection:NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        
        println("Started connection to HN")
        
        connection.start()
    }
    
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!) {
        println("Failed with error:\(error.localizedDescription)")
    }
    
    func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        //New request so we need to clear the data object
        self.data = NSMutableData()
    }
    
    //NSURLConnection delegate method
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        //Append incoming data
        self.data.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        //Finished receiving data and convert it to a JSON object
        var err: NSError
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data,
            options:NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        
        delegate?.didRecieveResponse(jsonResult)
    }
    
   
}
