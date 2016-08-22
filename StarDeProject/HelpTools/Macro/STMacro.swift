//
//  STMacro.swift
//  StarDeProject
//
//  Created by star on 16/8/11.
//  Copyright © 2016年 star. All rights reserved.
//

import Foundation
import UIKit

//第三方库
import Alamofire
import SnapKit

//swift没有宏定义，可以用let代替
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height

func RGBColor(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
}
