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
       
        let homeVC = HomeViewController()
        homeVC.tabBarItem.title = "主页"
        homeVC.tabBarItem.image = UIImage(named: "TabBar_home_23x23_")
        homeVC.tabBarItem.selectedImage = UIImage(named: "TabBar_home_23x23_selected")
 
        let mathVC = MathController()
        mathVC.tabBarItem.title = "数学"
        mathVC.tabBarItem.image = UIImage(named: "TabBar_gift_23x23_")
        mathVC.tabBarItem.selectedImage = UIImage(named: "TabBar_gift_23x23_selected")
        
        let extensionVC = ExtensionController()
        extensionVC.tabBarItem.title = "扩展"
        extensionVC.tabBarItem.image = UIImage(named: "TabBar_category_23x23_")
        extensionVC.tabBarItem.selectedImage = UIImage(named: "TabBar_category_23x23_selected")
        
        let uiVC = UIController() 
        uiVC.tabBarItem.title = "UI"
        uiVC.tabBarItem.image = UIImage(named: "TabBar_me_girl_23x23_")
        uiVC.tabBarItem.selectedImage = UIImage(named: "TabBar_me_girl_23x23_selected")
        
        self.viewControllers = [homeVC,mathVC,uiVC,extensionVC]
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
