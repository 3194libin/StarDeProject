//
//  MyCalculateView.swift
//  StarDeProject
//
//  Created by 钟逊超 on 16/8/30.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit

class MyCalculateView: UIView {

    var processLabel:UILabel?
    var resultLabel:UILabel?
    //进行响应式编程可以吗？当属性改变的时候直接在UI上呈现
    
    
    func addLabels()
    {
        processLabel = UILabel.init()
        processLabel?.snp_makeConstraints(closure: { (make) in
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH, 50))
            make.top.equalToSuperview().offset(10)
        })
        processLabel?.textColor = RGBColor(125, g: 125, b: 125)
        processLabel?.text = "0×0"
        processLabel?.font = UIFont.systemFontOfSize(18)
        self.addSubview(processLabel!)
        
        resultLabel = UILabel.init()
        resultLabel?.snp_makeConstraints(closure: { (make) in
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH, 80))
            make.top.equalToSuperview().offset(60)
        })
        resultLabel?.textColor = UIColor.whiteColor()
        resultLabel?.text = "5216661111"
        resultLabel?.font = UIFont.systemFontOfSize(18)
        self.addSubview(resultLabel!)
    }
    func addCollectionView()
    {
        
    }

}
