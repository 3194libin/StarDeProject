//
//  FittingTool.h
//  TxtRead
//
//  Created by star on 16/8/5.
//  Copyright © 2016年 star. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FitModel.h"
#import "FitResultModel.h"
@interface FittingTool : NSObject

+ (FitResultModel *)fitWithFitModel:(FitModel *)model;

@end
