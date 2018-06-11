//
//  WXJTabBarController.swift
//  WXJTabBar_Swift
//
//  Created by MrWXJ on 2018/6/11.
//  Copyright © 2018年 MrWXJ. All rights reserved.
//

import UIKit

class WXJTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = ViewController()
        let s = SecondViewController()
        self.addTabBar(childController: v, tabBarTitle: "首页", tabBarImage: "tab1-1", tabBaeSeletedImage: "tab1")
        self.addTabBar(childController: s, tabBarTitle: "推荐", tabBarImage: "tab2-1", tabBaeSeletedImage: "tab2")
        
        //去掉线条
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundImage = initWithImage(color: UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 0.8))
        
    }
    
    /// 设置Image 为了去掉顶部的分割线
    ///
    /// - Parameter color: 背景颜色
    func initWithImage(color:UIColor)->UIImage{
        let rect = CGRect(x: 0,y: 0,width: 1,height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func addTabBar(childController:UIViewController,tabBarTitle:NSString,tabBarImage:NSString,tabBaeSeletedImage:NSString) {
        //设置title
        childController.tabBarItem.title = tabBarTitle as String
        //设置默认显示的image
        childController.tabBarItem.image = UIImage(named:tabBarImage as String)
        //设置点击状态下的image 需要设置显示原图
        childController.tabBarItem.selectedImage = UIImage(named:tabBaeSeletedImage as String)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        //设置字体显示的颜色
        let seletedDic = NSMutableDictionary()
        seletedDic.setValue(UIColor.green, forKey: NSAttributedStringKey.foregroundColor.rawValue)
        childController.tabBarItem.setTitleTextAttributes((seletedDic as! [NSAttributedStringKey : Any]), for: UIControlState.selected)
        
        let navigationC = WXJNavigationController(rootViewController: childController)
        navigationC.navigationBar.isTranslucent = false
        navigationC.navigationBar.barTintColor = UIColor.white
        
        let navDic = NSMutableDictionary()
        navDic.setValue(UIColor.darkGray, forKey: NSAttributedStringKey.foregroundColor.rawValue)
//        navigationC.navigationBar.barStyle = UIBarStyle.black
        self.addChildViewController(navigationC)
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
