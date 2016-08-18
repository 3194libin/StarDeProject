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
