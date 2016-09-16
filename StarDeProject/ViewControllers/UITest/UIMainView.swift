//
//  UIMainView.swift
//  StarDeProject
//
//  Created by 钟逊超 on 16/9/16.
//  Copyright © 2016年 star. All rights reserved.
//

//定义枚举值和闭包
enum ClickType {
    case leftClick
    case rightUpClick
    case rightDownClick
}
typealias ClickView = (ClickType)->Void

import UIKit
// 该View主要用于在UI页面上显示相应的内容
class UIMainView: UIView {
    //定义一个属性传值
    var clickOperation:ClickView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //不使用UIColltionView，直接在上面添加View,可能导致可扩展性降低
        
        //set leftView
        addLeftView()
        addRightUpView(0)
        addRightUpView(1)
    }
    func addLeftView(){
        let leftView = UIView.init()
        leftView.backgroundColor = RGBColor(247, g: 117, b: 97)
        leftView.layer.cornerRadius = 5.0
        self.addSubview(leftView)
        leftView.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH/2-7.5,self.frame.height*3/5-10))
            make.left.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-15)
        }
        let leftTap = UITapGestureRecognizer.init(target: self,action:#selector(clickLeftView))
        leftView.addGestureRecognizer(leftTap)
        
        let leftImage = UIImageView.init(image: UIImage.init(imageLiteral: "myControl.png"))
        leftImage.bounds = CGRectMake(0, 0, 138/2, 146/2)
        leftImage.center = CGPointMake((SCREEN_WIDTH/2-7.5)/2, self.frame.height*3/5*2/3-20)
        leftView.addSubview(leftImage)
        //添加label
        let leftLabel = UILabel.init()
        leftLabel.text = "我的控件"
        leftLabel.textColor = RGBColor(210, g: 210, b: 210)
        leftLabel.textAlignment = NSTextAlignment.Center
        leftLabel.bounds = CGRectMake(0, 0, 100, 40)
        leftLabel.center = CGPointMake(leftImage.center.x, self.frame.height*3/5/3)
        leftView.addSubview(leftLabel)
    }
    func addRightUpView(viewPosition:Int){
        let rightUoView = UIView.init()
        rightUoView.backgroundColor = RGBColor(33, g: 195, b: 232)
        rightUoView.layer.cornerRadius = 5.0
        self.addSubview(rightUoView)
        rightUoView.bounds = CGRectMake(0, 0, SCREEN_WIDTH/2-7.5, self.frame.height*3/5/2-10)
        rightUoView.center = CGPointMake(SCREEN_WIDTH-5-(SCREEN_WIDTH/2-7.5)/2, self.frame.height*11/20-10)
        
        let leftImage = UIImageView.init(image: UIImage.init(imageLiteral: "dataPreView.png"))
        leftImage.bounds = CGRectMake(0, 0, 138/2, 146/2)
        leftImage.center = CGPointMake((SCREEN_WIDTH/2-7.5)/2, self.frame.height*3/5*2/6-20)
        rightUoView.addSubview(leftImage)
        //添加label
        let leftLabel = UILabel.init()
        leftLabel.text = "数据一览"
        leftLabel.textColor = RGBColor(210, g: 210, b: 210)
        leftLabel.textAlignment = NSTextAlignment.Center
        leftLabel.bounds = CGRectMake(0, 0, 100, 40)
        leftLabel.center = CGPointMake(leftImage.center.x, self.frame.height*3/5/6-20)
        rightUoView.addSubview(leftLabel)
        
        if viewPosition==1//表示下面，否则取默认值
        {
            rightUoView.backgroundColor = RGBColor(36, g: 220, b: 124)
            rightUoView.center = CGPointMake(SCREEN_WIDTH-5-(SCREEN_WIDTH/2-7.5)/2, self.frame.height*17/20-10)
            leftImage.image = UIImage.init(imageLiteral: "danymicEffect.png")
            leftLabel.text = "动态效果"
            let rightUpTap = UITapGestureRecognizer.init(target: self,action:#selector(clickRightDownView))
            rightUoView.addGestureRecognizer(rightUpTap)
        }
        else
        {
            let rightUpTap = UITapGestureRecognizer.init(target: self,action:#selector(clickRightUpView))
            rightUoView.addGestureRecognizer(rightUpTap)
        }
    }
    //使用闭包，不使用代理
    func clickLeftView(){
        if self.clickOperation != nil
        {
            self.clickOperation!(ClickType.leftClick)
        }
    }
    func clickRightUpView() {
        if self.clickOperation != nil
        {
            self.clickOperation!(ClickType.rightUpClick)
        }
    }
    func clickRightDownView() {
        if self.clickOperation != nil
        {
            self.clickOperation!(ClickType.rightDownClick)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
