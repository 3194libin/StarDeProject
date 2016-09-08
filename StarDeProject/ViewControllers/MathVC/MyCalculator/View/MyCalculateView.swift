//
//  MyCalculateView.swift
//  StarDeProject
//
//  Created by 钟逊超 on 16/8/30.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit
import AVFoundation
class MyCalculateView: UIView ,UICollectionViewDataSource,UICollectionViewDelegate{

    var processLabel:UILabel?
    var resultLabel:UILabel?
    internal var operationArray:[String]?
    var formulaString:String?
    var hasLeftBracket:Bool?
    

    //进行响应式编程可以吗？当属性改变的时候直接在UI上呈现
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor.lightGrayColor()
        formulaString = ""
        hasLeftBracket = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        addLabels()
        addCollectionView()
    }
    
    func addLabels()
    {
        processLabel = UILabel.init()
        self.addSubview(processLabel!)
        processLabel?.snp_makeConstraints(closure: { (make) in
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH-40, 50))
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(20)
        })
        processLabel?.textColor = UIColor.whiteColor()
        processLabel?.text = "0"
        processLabel?.font = UIFont.systemFontOfSize(18)
        processLabel?.textAlignment = NSTextAlignment.Right
        
        resultLabel = UILabel.init()
        self.addSubview(resultLabel!)
        resultLabel?.snp_makeConstraints(closure: { (make) in
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH-40, 80))
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(20)
        })
        resultLabel?.textColor = UIColor.whiteColor()
        resultLabel?.text = "0"
        resultLabel?.font = UIFont.systemFontOfSize(40)
        resultLabel?.textAlignment = NSTextAlignment.Right
    }
    func addCollectionView()
    {
        //此时还未指定数组?
        let calculateLayout = CalculateLayout()
        calculateLayout.cellCount = operationArray?.count
        let operationCollectionView = UICollectionView.init(frame: CGRectMake(0, SCREEN_HEIGHT-64-SCREEN_WIDTH*5/4+20, SCREEN_WIDTH, SCREEN_WIDTH*5/4-20), collectionViewLayout: calculateLayout)
        operationCollectionView.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cellId")
        operationCollectionView.dataSource = self
        operationCollectionView.delegate = self
        operationCollectionView.backgroundColor = UIColor.lightGrayColor()
        addSubview(operationCollectionView)
    }
    
    //实现UICollectionViewDatasource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (operationArray?.count)!
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath)
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        let operationLabel = UILabel.init()
        cell.contentView.addSubview(operationLabel)
        operationLabel.textColor = UIColor.whiteColor()
        operationLabel.text = operationArray![indexPath.row]
        operationLabel.textAlignment = NSTextAlignment.Center
        operationLabel.font = UIFont.systemFontOfSize(30)
        operationLabel.bounds = CGRectMake(0, 0, 60, 60)
        operationLabel.center = cell.contentView.center
        operationLabel.tag = 1234
//        operationLabel.snp_makeConstraints { (make) in
//            make.size.equalTo(CGSizeMake(60, 60))
//            make.center.equalToSuperview().offset(CGPointMake(SCREEN_WIDTH/8, SCREEN_WIDTH/8))
//        }
        cell.backgroundColor = UIColor.grayColor()
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //播放音效 http://www.cocoachina.com/bbs/read.php?tid=134344
        AudioServicesPlaySystemSound(1200)
        
        //更新上面的Label,获取cell label内的文字
        let collectionCell = collectionView.cellForItemAtIndexPath(indexPath)
        let oprationLabel = collectionCell?.contentView.viewWithTag(1234) as! UILabel
        print("当前点击的符号为\(oprationLabel.text),第\(indexPath.row)个单元格")
        if indexPath.row == 0//C
        {
            formulaString = ""
            processLabel?.text = "0"
            resultLabel?.text = "0"
        }
        else if indexPath.row == 1//<-
        {
            let length = formulaString!.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
            if length > 0//去除最后一个字符
            {
                let lastIndex = formulaString?.endIndex.advancedBy(-1)
                formulaString = formulaString?.substringToIndex(lastIndex!)
            }
             processLabel?.text = formulaString
        }
        else if indexPath.row == 15//=,点击＝需要将运算式归0,并且判断计算的有效性
        {
            formulaString = formulaString?.stringByAppendingString("=")
            processLabel?.text = formulaString
            //得到计算结果
            let calculate = CalculateResult()
            let result = calculate.calculateWithString(formulaString!)
            if result==PI//error
            {
                let alert = UIAlertView.init(title: "警告", message: "表达式错误", delegate: nil, cancelButtonTitle: "确定")
                alert.show()
            }
            else
            {
                resultLabel?.text = String(result)
            }
            formulaString = ""
            hasLeftBracket = false
        }
        else if indexPath.row == 16//()
        {
            if hasLeftBracket!
            {
                formulaString = formulaString?.stringByAppendingString(")")
            }
            else
            {
                formulaString = formulaString?.stringByAppendingString("(")
            }
            processLabel?.text = formulaString
            hasLeftBracket = !hasLeftBracket!
        }
        else//其他数字和运算符
        {
            formulaString = formulaString?.stringByAppendingString(oprationLabel.text!)
            processLabel?.text = formulaString
        }
    }
}
