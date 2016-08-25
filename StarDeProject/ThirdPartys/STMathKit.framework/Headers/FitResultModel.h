//
//  FitResultModel.h
//  TxtRead
//
//  Created by star on 16/8/5.
//  Copyright © 2016年 star. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FitResultModel : NSObject

- (instancetype)initWithFactor:(float)factor
                     addtional:(float)addtional
                      relation:(float)relation;

@property (nonatomic, readonly)float factorNum;//乘数

@property (nonatomic, readonly)float additionalNum;//加数

@property (nonatomic, readonly)float relationNum;//相关系数

@end
