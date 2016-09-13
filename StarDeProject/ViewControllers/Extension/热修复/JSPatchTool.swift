//
//  JSPatchTool.swift
//  StarDeProject
//
//  Created by star on 16/9/13.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit
import JSPatch
class JSPatchTool: NSObject {
    enum Error:ErrorType {
        case InitStringFail
    }
    
    //启动JS脚本：从本地沙盒获取JS文件
    func startJSPatch()
    {
        JPEngine.startEngine()
        let jsPath = getScriptPath()
        let scriptData = NSData(contentsOfFile: jsPath)
        if scriptData != nil
        {
            let script = NSString.init(data: scriptData!, encoding: NSUTF8StringEncoding)
            JPEngine.evaluateScript(script! as String)
        }
        else
        {
            print("沙盒内不存在该脚本文件")
        }
    }
    
    //copyBundleScript：将程序中的脚本copy到沙盒内,永远只执行一次
    func checkBundleScript()
    {
        let bundleScriptPath = NSBundle.mainBundle().pathForResource("local", ofType: "js")
        var staticToken:dispatch_once_t = 0;
        dispatch_once(&staticToken) { 
            let scriptData = NSData(contentsOfFile: bundleScriptPath!)
            let manager = NSFileManager.defaultManager()
            let jsPath = self.getScriptPath()
            if scriptData != nil
            {
                do{
                    try manager.copyItemAtPath(bundleScriptPath!, toPath: jsPath)
                }catch{
                    print("复制文件失败")
                }
            }
        }
    }
    //从服务器上下拉脚本文件
    func checkScriptFromServer()
    {
        print("未运行脚本->从服务器下拉脚本")
    }
    
    private func getScriptPath() -> String
    {
        let documentPathArray = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentPath = documentPathArray[0] as NSString
        let jsPath = documentPath.stringByAppendingPathComponent("local.js")
        return jsPath as String
    }
}
