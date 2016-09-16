//
//  ParticleView.swift
//  StarDeProject
//
//  Created by 钟逊超 on 16/9/16.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit
import QuartzCore
class ParticleView: UIView {

    var fireEmitter:CAEmitterLayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let rect = CGRectMake(0, -70, SCREEN_WIDTH, 50)
        
        
        fireEmitter = CAEmitterLayer()
        fireEmitter?.emitterSize = rect.size
        fireEmitter?.frame = rect
        fireEmitter?.emitterMode = kCAEmitterLayerLine;
        fireEmitter?.birthRate = 1
        self.layer.addSublayer(fireEmitter!)
        
        //CAEmitterCell
        let fire = CAEmitterCell()
        fire.birthRate = 1;
        fire.lifetime = 5.0;
        fire.lifetimeRange = 1;
        fire.contents = [UIImage.init(imageLiteral: "leaf.png") as AnyObject]
        fire.velocity = 50;
        fire.velocityRange = 30;
        fire.emissionRange = CGFloat(M_PI*2);
        fire.scaleSpeed = 0.3;
        fire.spin = 1;
        fire.name = "fire"
        
        fireEmitter?.emitterCells = [fire]
    }
    
    func setEmitterPosition(point:CGPoint)->Void{
        fireEmitter?.emitterPosition = point
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
