//
//  HomeViewController.swift
//  StarDeProject
//
//  Created by star on 16/8/9.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit
import Alamofire
class HomeViewController: STBaseController {

    let mengchongUrl = "http://www.ivsky.com/bizhi/liushishi_v37287/"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        setNavigation("美女", hasBackBtn: false)
        
        //天堂图片网
        requestNetData()
        addIMage()
        // Do any additional setup after loading the view.
    }

    private func requestNetData() {
        Alamofire.request(.GET, mengchongUrl, parameters: nil)
            .response { (request, response, data, error) in
                print(request)
                print(response)
                print(error)
                //print("data:"+data!.description)
                let dataString = String.init(data: data!, encoding: NSUTF8StringEncoding)
                if (dataString != nil)
                {
                    print(dataString)
                }
        }
    }
    
    private func addIMage(){
        let url:NSURL = NSURL(string: "http://img.ivsky.com/img/bizhi/t/201608/04/liushishi-008.jpg")!
        let imageData:NSData? = NSData(contentsOfURL:url )
        let image0 = UIImage(data: imageData!)
        let imageView = UIImageView.init(frame: CGRectMake(5, 100, SCREEN_WIDTH-10, (SCREEN_WIDTH-10)*1080/1920))
        imageView.image = image0
        self.view.addSubview(imageView)
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
