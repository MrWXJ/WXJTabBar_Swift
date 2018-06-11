//
//  ViewController.swift
//  WXJTabBar_Swift
//
//  Created by MrWXJ on 2018/6/11.
//  Copyright © 2018年 MrWXJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let next = NextViewController()
        next.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(next, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

