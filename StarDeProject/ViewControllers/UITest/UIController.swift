//
//  UIController.swift
//  StarDeProject
//
//  Created by star on 16/9/8.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit

class UIController: STBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.orangeColor()
        setNavigation("UI", hasBackBtn: false)
        //设置背景的渐变色
        let gradualLayer = CAGradientLayer()
        gradualLayer.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-44)
        self.view.layer.addSublayer(gradualLayer)
        //颜色分配
        gradualLayer.colors = [UIColor.cyanColor().CGColor,UIColor.magentaColor().CGColor,UIColor.purpleColor().CGColor]
        gradualLayer.locations = [0.25,0.5,0.75]
        gradualLayer.startPoint = CGPointMake(0, 0)
        gradualLayer.endPoint = CGPointMake(0, 1)
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
