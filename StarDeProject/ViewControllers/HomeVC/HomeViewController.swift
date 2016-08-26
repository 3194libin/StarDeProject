//
//  HomeViewController.swift
//  StarDeProject
//
//  Created by star on 16/8/9.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit
import Kingfisher
let cellId = "STCellId"

class HomeViewController: STBaseController,UITableViewDelegate,UITableViewDataSource{

    //http://www.ivsky.com/bizhi/liushishi_v37287/
    //http://www.ivsky.com/search.php?q=%E5%88%98%E8%AF%97%E8%AF%97
    let mengchongUrl = "http://www.quanjing.com/"
    var imageUrls:[String]?
    let imageCache:NSCache = NSCache.init()
    var nextUrls:[String]? = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        setNavigation("美女", hasBackBtn: false)
        
        //天堂图片网
        requestNetData()
        setNextUrls()
        
        //设置TableView
        imageUrls = ["http://img.ivsky.com/img/bizhi/t/201608/04/liushishi-001.jpg",
                     "http://img.ivsky.com/img/bizhi/t/201608/04/liushishi-002.jpg",
                     "http://img.ivsky.com/img/bizhi/t/201608/04/liushishi-003.jpg",
                     "http://img.ivsky.com/img/bizhi/t/201608/04/liushishi-004.jpg",
                     "http://img.ivsky.com/img/bizhi/t/201608/04/liushishi-005.jpg",
                     "http://img.ivsky.com/img/bizhi/t/201608/04/liushishi-006.jpg",
                     "http://img.ivsky.com/img/bizhi/t/201608/04/liushishi-007.jpg",
                     "http://img.ivsky.com/img/bizhi/t/201608/04/liushishi-008.jpg"]
        let tableView = UITableView.init(frame: CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-44), style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
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
    
    
    //Mark :TableView Datasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (imageUrls?.count)!
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 180.0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        if cell==nil
        {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }
        else
        {
            for view in (cell?.contentView.subviews)! {
                view.removeFromSuperview()
            }
        }
        
        
        let imageView = UIImageView.init()
        imageView.layer.cornerRadius = 5.0
        imageView.backgroundColor = UIColor.lightGrayColor()
        imageView.kf_setImageWithURL(NSURL(string:imageUrls![indexPath.row]))
        cell?.contentView.addSubview(imageView)
        //使用布局工具SnapKit
        imageView.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH-10, (SCREEN_WIDTH-10)*1080/1920))
            make.top.equalToSuperview().offset(CGPointMake(0, 2))
            make.left.equalToSuperview().offset(5)
        }
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("您选中了第\(indexPath.row)行")
        let webVC = WebController()
        webVC.stUrl = nextUrls![indexPath.row]
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    
    func setNextUrls(){
        
        let keyArray = ["婴儿","家庭","配饰","健身","时尚","别墅",
                        "运动","家居","城市","科技","道路","商务",
                        "旅游","美食","健康","名车","爱情","田园风光",
                        "公路","名车","驾驭","速度","奥迪","道路"];
        let characterSet = NSCharacterSet(charactersInString: "`#%^{}\"[]|\\<>").invertedSet
        
        for i in 0 ..< keyArray.count
        {
            var startString = "http://www.quanjing.com/search.aspx?q=%E8%BF%90%E5%8A%A8||1|60|1|2||||"
            startString.replaceRange(startString.rangeOfString("%E8%BF%90%E5%8A%A8")!, with: keyArray[i])
            let encodingString = startString.stringByAddingPercentEncodingWithAllowedCharacters(characterSet)
            nextUrls?.append(encodingString!)
        }
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


