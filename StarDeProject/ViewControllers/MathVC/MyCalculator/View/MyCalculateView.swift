//
//  MyCalculateView.swift
//  StarDeProject
//
//  Created by 钟逊超 on 16/8/30.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit

class MyCalculateView: UIView ,UICollectionViewDataSource{

    var processLabel:UILabel?
    var resultLabel:UILabel?
    var operationArray:[String]?
    
    //进行响应式编程可以吗？当属性改变的时候直接在UI上呈现
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        addLabels()
        addCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func 
    
    func addLabels()
    {
        processLabel = UILabel.init()
        self.addSubview(processLabel!)
        processLabel?.snp_makeConstraints(closure: { (make) in
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH, 50))
            make.top.equalToSuperview().offset(10)
        })
        processLabel?.textColor = RGBColor(125, g: 125, b: 125)
        processLabel?.text = "0×0"
        processLabel?.font = UIFont.systemFontOfSize(18)
        
        
        resultLabel = UILabel.init()
        self.addSubview(resultLabel!)
        resultLabel?.snp_makeConstraints(closure: { (make) in
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH, 80))
            make.top.equalToSuperview().offset(60)
        })
        resultLabel?.textColor = UIColor.whiteColor()
        resultLabel?.text = "5216661111"
        resultLabel?.font = UIFont.systemFontOfSize(18)
    }
    func addCollectionView()
    {
        //此时还未指定数组?
        let calculateLayout = CalculateLayout()
        calculateLayout.cellCount = operationArray?.count
        let operationCollectionView = UICollectionView.init(frame: CGRectMake(0, SCREEN_HEIGHT-64-SCREEN_WIDTH*5/4, SCREEN_WIDTH, SCREEN_WIDTH*5/4), collectionViewLayout: calculateLayout)
        operationCollectionView.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cellId")
        operationCollectionView.dataSource = self
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
        operationLabel.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(60, 60))
            make.center.equalTo(cell.center)
        }
        operationLabel.textColor = UIColor.redColor()
        operationLabel.text = operationArray![indexPath.row]
        cell.contentView.addSubview(operationLabel)
        return cell
    }
}
