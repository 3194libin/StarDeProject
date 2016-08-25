//
//  STBaseController.swift
//  StarDeProject
//
//  Created by 钟逊超 on 16/8/18.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit

class STBaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }
    
    //将被子类调用的方法
    func setNavigation(title:String,hasBackBtn:Bool){
        let headerView = UIView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, 64))
        headerView.backgroundColor = RGBColor(245, g: 80, b: 83)
        self.view.addSubview(headerView)
        
        let titleLabel = UILabel.init(frame: CGRectMake(100, 20, SCREEN_WIDTH-200, 44))
        titleLabel.text = title
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.font = UIFont.systemFontOfSize(20)
        titleLabel.textAlignment = NSTextAlignment.Center
        headerView.addSubview(titleLabel)
        
        if hasBackBtn//添加返回键
        {
            let backBtn = UIButton.init(frame: CGRectMake(10, 27, 31, 31))
            backBtn.setImage(UIImage.init(imageLiteral: "back"), forState: UIControlState.Normal)
            backBtn.addTarget(self, action: #selector(backToLastVC), forControlEvents: UIControlEvents.TouchUpInside)
            backBtn.backgroundColor = UIColor.redColor()
            headerView.addSubview(backBtn)
        }
    }

    @objc private func backToLastVC(){
        self.navigationController?.popViewControllerAnimated(true)
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
