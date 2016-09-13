//
//  ExtensionController.swift
//  StarDeProject
//
//  Created by star on 16/8/22.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit

class ExtensionController: STBaseController,ScrollPickerDataSource,ScrollPickerDelegate {
    var functionArray:[String]?
    
    override func viewDidLoad() {
        self.setNavigation("扩展", hasBackBtn: false)
        
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        super.loadView()
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.greenColor()
        
        let backImage = UIImageView.init(frame: CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64))
        backImage.image = UIImage.init(imageLiteral: "beauti")
        self.view.addSubview(backImage)
        
        functionArray = ["JS热修复","RSA加密证书","数据库安全","功能三","功能四"]
        let isp = InfiniteScrollPicker.init(frame: CGRectMake(0, 100, SCREEN_WIDTH, 300))
        isp.dataSource = self
        isp.tapDelegate = self
        isp.itemSize = CGSizeMake(200, 200)
        self.view.addSubview(isp)
    }
    
    //ScrollPickerDelegate
    func viewAmount() -> Int {
        return (functionArray?.count)!
    }
    func viewForIndex(index: Int) -> UIView! {
        let view = UIView.init(frame: CGRectMake(0, 0, 250, 250))
        view.backgroundColor = RGBColor(255, g: 0, b: 0)
        view.alpha = 0.3
        view.layer.masksToBounds = true
        view.layer.cornerRadius = view.bounds.size.width/2
        let label = UILabel.init()
        label.bounds = CGRectMake(0, 0, 150, 50)
        label.center = view.center
        label.textAlignment = NSTextAlignment.Center
        label.text = functionArray![index]
        view.addSubview(label)
        return view
    }
    func didTapViewAtIndex(index: Int) {
        switch index
        {
        case 0:
            print("进入热修复")
            let jsVC = JSPatchController()
            self.navigationController?.pushViewController(jsVC, animated: true)
            break
        default:
            break
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
