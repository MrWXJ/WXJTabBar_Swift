//
//  WXJNetwork.swift
//  WXJTabBar_Swift
//
//  Created by MrWXJ on 2018/6/11.
//  Copyright © 2018年 MrWXJ. All rights reserved.
//

import UIKit

typealias ReturnNetworkData = (_ data:Any,_ error:Error) -> ();

typealias ReturnCookie = (NSMutableString);

enum WXJHTTPMethod {
    case methodOfGet//GET
    case methodOfPost//POST
}

class WXJNetwork: NSObject {
    var returnNetworkData:ReturnNetworkData?
    var a2ClickCallBack:((String) -> ())?
    func initWXJNetwork(method:WXJHTTPMethod,url:String,parameter:String,cookieBool:Bool) {
        let urlStr: NSURL = NSURL(string: url as String)!
        var request = URLRequest(url:urlStr as URL)
        
        if method == WXJHTTPMethod.methodOfGet {
            request.httpMethod = "GET"
        } else {
            request.httpMethod = "POST"
        }
        request.timeoutInterval = 10
        if cookieBool == true {
            let string = NSString(format:UserDefaults.standard.object(forKey: "cookie") as! NSString)
            request.setValue(string as String, forHTTPHeaderField: "cookie")
        }
        
        let data = parameter.data(using: String.Encoding.utf8)
        request.httpBody = data
        let session = URLSession.shared

        let dataTask = session.dataTask(with: request,completionHandler: {(data, response, error) -> Void in
            if error == nil {
//                let jsonObj = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
                
                
                if (self.returnNetworkData != nil) {
                }
                self.a2ClickCallBack!("sadasdas")
            } else {
                self.a2ClickCallBack!("22222222")
            }
        }) as URLSessionTask
        
        //使用resume方法启动任务
        dataTask.resume()
    }
    
}
