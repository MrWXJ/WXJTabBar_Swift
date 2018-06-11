//
//  WXJNavigationController.swift
//  WXJTabBar_Swift
//
//  Created by MrWXJ on 2018/6/11.
//  Copyright © 2018年 MrWXJ. All rights reserved.
//

import UIKit

class WXJNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = UIBarButtonItem.appearance()
        let navDic = NSMutableDictionary()
        navDic.setValue(UIColor.darkGray, forKey: NSAttributedStringKey.foregroundColor.rawValue)
        navDic.setValue(UIFont.systemFont(ofSize: 16), forKey: NSAttributedStringKey.font.rawValue)
        item.setTitleTextAttributes((navDic as! [NSAttributedStringKey : Any]), for: UIControlState.normal)

        // Do any additional setup after loading the view.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: true)
        if self.viewControllers.count > 1 {
            viewController.navigationItem.leftBarButtonItem = WXJNavigationController.initItemWithTarget(target: self, action: #selector(WXJNavigationController.pop), image: "backButton", selectedImage: "backButton")
            
        }
    }
    
    @objc func pop() {
        self.popViewController(animated: true)
    }
    
    class func initItemWithTarget(target:Any,action:Selector,image:NSString,selectedImage:NSString) -> UIBarButtonItem {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setImage(UIImage(named:image as String), for: UIControlState.normal)
        btn.setImage(UIImage(named:selectedImage as String), for: UIControlState.selected)
        btn.frame.size = CGSize(width:30,height:30)
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        let backBtn = UIBarButtonItem(customView:btn)
        
        return backBtn
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
