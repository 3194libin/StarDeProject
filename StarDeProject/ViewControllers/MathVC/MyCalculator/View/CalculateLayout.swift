//
//  CalculateLayout.swift
//  StarDeProject
//
//  Created by star on 16/8/30.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit
import Foundation
class CalculateLayout: UICollectionViewLayout {
    internal var cellCount:Int?
    
    override func prepareLayout() {
        //做一些准备工作
    }
    
    override func collectionViewContentSize() -> CGSize {
        return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH)
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes = Array<UICollectionViewLayoutAttributes>()
        for i in 0...cellCount!-1 {
            let indexPath = NSIndexPath(forRow: i,inSection: 0)
            attributes.append(layoutAttributesForItemAtIndexPath(indexPath))
        }
        return attributes
    }
    
    //返回每个单元格的大小和位置
    override func layoutAttributesForItemAtIndexPath(indexPath:NSIndexPath) -> UICollectionViewLayoutAttributes {
        let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath:indexPath)
        let cellSize = CGSizeMake(SCREEN_WIDTH/4-1, SCREEN_WIDTH/4-5)
        print("当前是第\(indexPath.row)个单元格")
        let vectorIndex = indexPath.row%4
        let center = CGPointMake(CGFloat(vectorIndex)*SCREEN_WIDTH/4+SCREEN_WIDTH/8, CGFloat(indexPath.row/4)*(SCREEN_WIDTH/4-4)+SCREEN_WIDTH/8)
        print("单元格中心为\(center.x),\(center.y)")
        if (indexPath.row) != 15
        {
            attributes.size = cellSize
            attributes.center = center
        }
        else
        {
            attributes.size = CGSizeMake(SCREEN_WIDTH/4-1, SCREEN_WIDTH/2-9)
            attributes.center = CGPointMake(CGFloat(vectorIndex)*SCREEN_WIDTH/4+SCREEN_WIDTH/8, CGFloat(indexPath.row/4)*(SCREEN_WIDTH/4-4)+SCREEN_WIDTH/4-2)
        }
        
        return attributes
    }
}
