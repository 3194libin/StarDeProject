//
//  HomeViewController.swift
//  StarDeProject
//
//  Created by star on 16/8/9.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        self.title = "主页"
        
        let nextBn:UIButton = UIButton.init(frame: CGRectMake(20, 100, 100, 40))
        nextBn.setTitle("跳转", forState: UIControlState.Normal)
        self.view.addSubview(nextBn)
        nextBn.addTarget(self, action: #selector(goToNaxtView), forControlEvents: UIControlEvents.TouchUpInside)
        // Do any additional setup after loading the view.
    }
    
    //无效
    func goToNaxtView(){
        let vc1 = ViewController1()
        self.navigationController?.pushViewController(vc1, animated: true)
        
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