//
//  JSPatchController.swift
//  StarDeProject
//
//  Created by star on 16/9/13.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit
import SnapKit
class JSPatchController: STBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation("热修复测试", hasBackBtn: true)
        
        let imageView = UIImageView.init(image: UIImage.init(imageLiteral: "beautifulGirl0.jpg"))
        self.view.addSubview(imageView)
        imageView.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT-64))
            make.top.equalToSuperview().offset(64)
            make.left.equalToSuperview().offset(0)
        }
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("你点击了页面,测试JS脚本")
        let tool = JSPatchTool()
        tool.checkScriptFromServer()
        testJS()
    }
    
    func testJS(){
        print("未运行脚本时的方法")
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
