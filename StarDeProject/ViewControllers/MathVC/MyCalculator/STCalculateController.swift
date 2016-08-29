//
//  STCalculateController.swift
//  StarDeProject
//
//  Created by star on 16/8/29.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit

class STCalculateController: STBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation("我的计算器", hasBackBtn: true)
        self.view.backgroundColor = UIColor.lightGrayColor()
        // Do any additional setup after loading the view.
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
