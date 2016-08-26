//
//  LinearFitController.swift
//  StarDeProject
//
//  Created by 钟逊超 on 16/8/26.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit
import STMathKit
class LinearFitController: STBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation("线性拟合", hasBackBtn: true)
        self.view.backgroundColor = UIColor.whiteColor()
        
        //运用自己建立的框架
        let xArray = ["0","1","2","3","4","5","6","7","8","9","10"]
        let yArray = ["109050","111088","113144","115118","116632","118411","119155","120987","122825","123474","124181"]
        let fitModel = FitModel.init(XArray: xArray, yArray: yArray)
        let fitResult = FittingTool.fitWithFitModel(fitModel)
        print("拟合结果为:\ny=\(fitResult.factorNum)x+\(fitResult.additionalNum) ,相关系数为:\(fitResult.relationNum)")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
