//
//  StringHandle.swift
//  StarDeProject
//
//  Created by 钟逊超 on 16/8/21.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit

class StringHandle: NSObject {
    
    func extractImageWebsite(text:String) -> NSArray {
        //需要一个解析网络数据的类
//        NSArray *matchArray = NULL;
//        matchArray = [htmlStr componentsMatchedByRegex:regexString];
        var stringArray:Array = Array<String>()
        let regexString = "sdjofji"
        return stringArray
    }
}
/*
NSString *searchText = @"// Do any additional setup after loading the view, typically from a nib.";
NSError *error = NULL;
NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(?:[^,])*\\." options:NSRegularExpressionCaseInsensitive error:&error];
NSTextCheckingResult *result = [regex firstMatchInString:searchText options:0 range:NSMakeRange(0, [searchText length])];
if (result) {
    NSLog(@"%@\n", [searchText substringWithRange:result.range]);
}
 */