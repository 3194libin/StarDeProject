//
//  HomeTabbarController.swift
//  StarDeProject
//
//  Created by star on 16/8/11.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit

class HomeTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = RGBColor(245, g: 80, b: 83)
        setTabbarController()
        // Do any additional setup after loading the view.
    }

    //单糖的方法感觉不好
    private func setTabbarController(){
       
        let fontSize:CGFloat = 25.0
        let homeVC = HomeViewController()
        homeVC.tabBarItem.title = "主页"
        homeVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -10)
        homeVC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:RGBColor(101, g: 205, b: 253),NSFontAttributeName:UIFont.boldSystemFontOfSize(fontSize)], forState: UIControlState.Normal)
        let mathVC = MathController()
        mathVC.tabBarItem.title = "数学"
        mathVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -10)
        mathVC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:RGBColor(101, g: 205, b: 253),NSFontAttributeName:UIFont.boldSystemFontOfSize(fontSize)], forState: UIControlState.Normal)
        
        self.viewControllers = [homeVC,mathVC]
    }
    
    //初始化子控制器
    private func addChildViewController(childControllerName: String, title: String, imageName: String) {
        // 动态获取命名空间
        let ns = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        // 将字符串转化为类，默认情况下命名空间就是项目名称，但是命名空间可以修改
        let cls: AnyClass? = NSClassFromString(ns + "." + childControllerName)
        let vcClass = cls as! UIViewController.Type
        let vc = vcClass.init()
        // 设置对应的数据
        //        vc.tabBarItem.image = UIImage(named: imageName)
        //        vc.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        vc.title = title
        // 给每个控制器包装一个导航控制器
        let nav = STNavigationController()
        nav.addChildViewController(vc)
        addChildViewController(nav)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
