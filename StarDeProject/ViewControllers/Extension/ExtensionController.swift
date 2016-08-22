//
//  ExtensionController.swift
//  StarDeProject
//
//  Created by star on 16/8/22.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit

class ExtensionController: STBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.greenColor()
        self.setNavigation("扩展", hasBackBtn: false)
        
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
