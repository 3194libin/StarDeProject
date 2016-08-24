

//
//  WebController.swift
//  StarDeProject
//
//  Created by star on 16/8/24.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit

class WebController: STBaseController {
    public var stUrl:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setNavigation("美丽图片", hasBackBtn: true)
        
        print("网址为：\(stUrl)")
        let webView = UIWebView.init(frame: CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64))
        self.view.addSubview(webView)
        let newUrltext:String = stUrl!
        let url = NSURL(string: newUrltext)
        let baiduUrl = NSURL(string: "http://www.quanjing.com/search.aspx?q=%E8%BF%90%E5%8A%A8||1|60|1|2||||")
        
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
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
