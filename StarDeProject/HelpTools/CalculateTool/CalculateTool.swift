//
//  CalculateTool.swift
//  StarDeProject
//
//  Created by star on 16/8/31.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit

//http://www.cnblogs.com/5un5hine/archive/2009/11/09/2049346.html

/*
 直接使用数组来表示栈，基本算法如下：
 比如使用1+（2-3*1）＊4= 这样的运算式，从前向后扫描，像数组中顺序读入1 2 3 1 4,运算符数组为 + ( - * ) * =
 然后从前向后读取，直到运算符数组只剩下＝为止：计算过程中不断删除原有运算符
 运算符在栈内和栈外的优先级是不同的，但是必须保证（）能够互相抵消
 */
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
    //弹出一个运算数,返回弹出数:小数点也是数
    func popOperand() -> Float
    {
        if opndStack?.count > 0
        {
             let last = opndStack?.last
            opndStack?.removeLast()
            let lastString = last! as NSString
            return lastString.floatValue
        }
        return 0.0
    }
    //弹出一个运算符
    func popOperator() -> String
    {
        if optrStack?.count>0
        {
            let last = optrStack?.last
            optrStack?.removeLast()
            return last!
        }
        return ""
    }
    //取栈顶运算数
    func getTopOperand() -> Float
    {
        if opndStack?.count > 0
        {
            let last = opndStack?.last
            let lastString = last! as NSString
            return lastString.floatValue
        }
        return 0.0
    }
    //取栈顶运算符
    func getTopOperator() -> String
    {
        if optrStack?.count>0
        {
            let last = optrStack?.last
            return last!
        }
        return ""
    }
    //判断字符串是否为运算符
    func isOperator(c:String)->Bool
    {
        if c=="+" || c=="÷" || c=="×" || c=="－" || c=="=" || c=="(" || c==")"
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    //判断运算符的优先级:栈内和栈外的区别
    func precedeInStack(s:String) -> Int
    {
        switch s {
        case "-":
            fallthrough
        case "+":
            return 2
        case "×":
            fallthrough
        case "÷":
            return 4
        case "(":
            return 0
        case ")":
            return 7
        default:
            return -1
        }
    }
    func precedeOutStack(s:String) -> Int
    {
        switch s {
        case "-":
            fallthrough
        case "+":
            return 1
        case "×":
            fallthrough
        case "÷":
            return 3
        case "(":
            return 7
        case ")":
            return 0
        default:
            return -1
        }
    }
    
    //进行单独的运算
    func operate(x:Float,opr:String,y:Float) -> Float
    {
        var result:Float?
        switch opr
        {
        case "+":
            result = x+y
            break
        case "-":
            result = x-y
            break
        case "×":
            result = x*y
            break
        case "÷":
            if y != 0
            {
                result = x/y
            }
            else
            {
                return PI
            }
            break
        default:
            result = 0
            break
        }
        return result!
    }
}
