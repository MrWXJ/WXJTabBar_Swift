//
//  NextViewController.swift
//  WXJTabBar_Swift
//
//  Created by MrWXJ on 2018/6/11.
//  Copyright © 2018年 MrWXJ. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

        self.view.backgroundColor = UIColor.red
        
        let net = WXJNetwork()

        net.initWXJNetwork(method: WXJHTTPMethod.methodOfPost, url: "http://www.24hmart.cn:8081/comm/noticeAppIndex", parameter: "depId=8510305&page=1&pageSize=10", cookieBool: false);
        net.a2ClickCallBack = {(par:String) in
            print(par)
        };
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
