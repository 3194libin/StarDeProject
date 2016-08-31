//
//  CalculateTool.swift
//  StarDeProject
//
//  Created by star on 16/8/31.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit

//http://www.cnblogs.com/5un5hine/archive/2009/11/09/2049346.html
class CalculateTool: NSObject {
    var opndStack:Array<String>?    //运算数栈
    var optrStack:Array<String>?    //运算符栈
    
    //初始化运算数栈
    func initOpndStack()
    {
        opndStack = Array<String>()
    }
    //初始化运算符栈
    func initOptrStack(){
        optrStack = Array<String>()
    }
    //压入运算数
    func pushOperand(operand:String)
    {
        opndStack?.append(operand)
    }
    //压入运算符
    func pushOperator(optr:String)
    {
        optrStack?.append(optr)
    }
    //弹出一个运算数,返回弹出数
    func popOperand() -> Float
    {
        
    }
}
