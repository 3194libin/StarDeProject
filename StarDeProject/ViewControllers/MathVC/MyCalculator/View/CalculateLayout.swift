//
//  CalculateLayout.swift
//  StarDeProject
//
//  Created by star on 16/8/30.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit

class CalculateLayout: UICollectionViewLayout {
    var cellCount:Int?
    
    override func prepareLayout() {
        //做一些准备工作
    }
    
    override func collectionViewContentSize() -> CGSize {
        return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH*5/4)
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes = Array<UICollectionViewLayoutAttributes>()
        for i in 0...cellCount!-1 {
            let indexPath = NSIndexPath(index:i)
            attributes.append(layoutAttributesForItemAtIndexPath(indexPath))
        }
        return attributes
    }
    
    //返回每个单元格的大小和位置
    override func layoutAttributesForItemAtIndexPath(indexPath:NSIndexPath) -> UICollectionViewLayoutAttributes {
        let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath:indexPath)
        let cellSize = CGSizeMake(SCREEN_WIDTH/4, SCREEN_WIDTH/4)
        let vectorIndex = indexPath.row%4
        let center = CGPointMake(CGFloat(vectorIndex)*SCREEN_WIDTH/4+SCREEN_WIDTH/8, CGFloat(indexPath.row/4)*SCREEN_WIDTH/4+SCREEN_WIDTH/8)
        attributes.size = cellSize
        attributes.center = center
        return attributes
    }
}
