//
//  CalculateResult.swift
//  StarDeProject
//
//  Created by 钟逊超 on 16/8/31.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit

class CalculateResult: NSObject {
    var calculateTool:CalculateTool!
    
    override init() {
        super.init()
        calculateTool = CalculateTool()
        calculateTool.initOptrStack()
        calculateTool.initOpndStack()
    }
    //如何排除异常的表达式，包括小数点，除以0，其他格式
    func calculateWithString(s:String) -> Float
    {
        var calculateString = stringToArray(s)
        var result:Float = 0.0//初始化一个结果
        while calculateString.count>0
        {
            let firstElement = calculateString.first
            if firstElement?.componentsSeparatedByString(".").count>2
            {
                return PI
            }
            else if Float(firstElement!)==nil//如果是运算符,则比较优先级；多个小数点的情况
            {
                let topOptr = calculateTool.getTopOperator()
                //如果栈内运算符优先级较低,则运算符入栈
                if calculateTool.precedeInStack(topOptr)<calculateTool.precedeOutStack(firstElement!)
                {
                    calculateTool.pushOperator(firstElement!)
                    calculateString.removeAtIndex(0)
                    continue
                }
                //从符号栈弹出一个运算符，从对象栈弹出2个操作数，运算结果压入对象栈
                else if calculateTool.precedeInStack(topOptr)>calculateTool.precedeOutStack(firstElement!)
                {
                    let popOptr = calculateTool.popOperator()
                    let secondNumber = calculateTool.popOperand()
                    let firstNumber = calculateTool.popOperand()
                    let tempResult = calculateTool.operate(firstNumber, opr: popOptr, y: secondNumber)
                    if tempResult==PI//如果除以0
                    {
                        calculateTool.initOptrStack()
                        calculateTool.initOpndStack()
                        return PI
                    }
                    
                    calculateTool.pushOperand(String(tempResult))
                    continue
                }
                else//两个运算符相等时，从运算栈抵消
                {
                    let a = calculateTool.popOperator()
                    print("弹出的运算符为\(a)")
                    calculateString.removeAtIndex(0)
                    continue
                }
            }
            else//如果运算数则直接入栈，如果有两个小数点需要报错
            {
                calculateTool.pushOperand(firstElement!)
                calculateString.removeAtIndex(0)
                continue
            }
        }
        //上述步骤结束后那么剩下的运算符必然有序排列:从运算符栈弹出一个运算符，从运算数栈弹出两个运算数，将结果压入运算数
        while calculateTool.getTopOperator() != ""
        {
            let popOptr = calculateTool.popOperator()
            let secondNumber = calculateTool.popOperand()
            let firstNumber = calculateTool.popOperand()
            let tempResult = calculateTool.operate(firstNumber, opr: popOptr, y: secondNumber)
            calculateTool.pushOperand(String(tempResult))
        }
        result = calculateTool.getTopOperand()
        calculateTool.initOptrStack()
        calculateTool.initOpndStack()
        return result
    }
    
    
    //将输入的字符串输出为数组
    func stringToArray(s:String) -> Array<String>
    {
        var stringArray = Array<String>()
        var mutableStr = s
        while mutableStr.characters.count>0
        {
            let firstCharacter = mutableStr.substringToIndex(mutableStr.startIndex.advancedBy(1))
            if Int(firstCharacter)>=0 &&  Int(firstCharacter)<10//如果是数字
            {
                let length = mutableStr.characters.count
                
                //从前向后扫描
                for i in 0...length-1
                {
                    let character = mutableStr.substringWithRange(Range(start:mutableStr.startIndex.advancedBy(i),end:mutableStr.startIndex.advancedBy(i+1)))
                    print("该字符的整数值为\(Int(character))")
                    if Int(character)==nil && character != "."
                    {
                        let numberStr = mutableStr.substringToIndex(mutableStr.startIndex.advancedBy(i))
                        stringArray.append(numberStr)
                        mutableStr = mutableStr.substringFromIndex(mutableStr.startIndex.advancedBy(i))
                        break//跳出当次循环
                    }
                }
            }
            else//如果是运算符
            {
                stringArray.append(firstCharacter)
                mutableStr = mutableStr.substringFromIndex(mutableStr.startIndex.advancedBy(1))
            }
        }
        
        return stringArray
    }
  
}
