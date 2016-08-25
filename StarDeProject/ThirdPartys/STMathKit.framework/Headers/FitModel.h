//
//  FitModel.h
//  TxtRead
//
//  Created by star on 16/8/5.
//  Copyright © 2016年 star. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FitModel : NSObject
- (instancetype)initWithXArray:(NSArray *)xArray yArray:(NSArray *)yArray;

@property (nonatomic,readonly)NSArray *xArray;

@property (nonatomic,readonly)NSArray *yArray;

@end
