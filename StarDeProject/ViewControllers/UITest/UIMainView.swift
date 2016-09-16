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
        
        //顶部的喷射效果
//        let particleView = ParticleView.init(frame: CGRectMake(0, 0, SCREEN_WIDTH, 100))
//        self.addSubview(particleView)
//        particleView.setEmitterPosition(CGPointMake(100, 300))
        addTopJet()
        
        //set leftView
        addLeftView()
        addRightUpView(0)
        addRightUpView(1)
    }
    
    func addTopJet(){
        let rect = CGRect(x: 0.0, y: -70.0, width: self.bounds.width,
                          height: 50.0)
        let emitter = CAEmitterLayer()
        emitter.frame = rect
        self.layer.addSublayer(emitter)
        emitter.emitterShape = kCAEmitterLayerRectangle
        
        //kCAEmitterLayerPoint
        //kCAEmitterLayerLine
        //kCAEmitterLayerRectangle
        
        emitter.emitterPosition = CGPointMake(rect.width/2, rect.height/2)
        emitter.emitterSize = rect.size
        
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage.init(imageLiteral: "leaf.png").CGImage
        emitterCell.birthRate = 120  //每秒产生120个粒子
        emitterCell.lifetime = 3    //存活1秒
        emitterCell.lifetimeRange = 3.0
        
        emitter.emitterCells = [emitterCell]  //这里可以设置多种粒子 我们以一种为粒子
        emitterCell.yAcceleration = 70.0  //给Y方向一个加速度
        emitterCell.xAcceleration = 20.0 //x方向一个加速度
        emitterCell.velocity = 20.0 //初始速度
        emitterCell.emissionLongitude = CGFloat(-M_PI) //向左
        emitterCell.velocityRange = 200.0   //随机速度 -200+20 --- 200+20
        emitterCell.emissionRange = CGFloat(M_PI_2) //随机方向 -pi/2 --- pi/2
        //emitterCell.color = UIColor(red: 0.9, green: 1.0, blue: 1.0,
        //   alpha: 1.0).CGColor //指定颜色
        emitterCell.redRange = 0.3
        emitterCell.greenRange = 0.3
        emitterCell.blueRange = 0.3  //三个随机颜色
        
        emitterCell.scale = 0.8
        emitterCell.scaleRange = 0.8  //0 - 1.6
        emitterCell.scaleSpeed = -0.15  //逐渐变小
        
        emitterCell.alphaRange = 0.75   //随机透明度
        emitterCell.alphaSpeed = -0.15  //逐渐消失
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
