//
//  MathController.swift
//  StarDeProject
//
//  Created by star on 16/8/11.
//  Copyright © 2016年 star. All rights reserved.
//

import UIKit

class MathController: STBaseController,UITableViewDelegate,UITableViewDataSource {

    var  textArray:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellowColor()
        setNavigation("数学", hasBackBtn: false)
        
        //线性拟合，计算器，神经网络，深度学习,VR
        textArray = ["线性拟合","计算器","我的计算器","神经网络","深度学习","VR","对角棋"]
        
        let tableView = UITableView.init(frame: CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-44), style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)
        // Do any additional setup after loading the view.
    }
    
    //Mark :TableView Datasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (textArray?.count)!
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        if cell==nil
        {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }
        else
        {
            for view in (cell?.contentView.subviews)! {
                view.removeFromSuperview()
            }
        }
        
        cell?.textLabel?.text = textArray![indexPath.row]
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("您选中了第\(indexPath.row)行")
        switch indexPath.row {
        case 0:
            let linearFitVC = LinearFitController()
            self.navigationController?.pushViewController(linearFitVC, animated: true)
            break
        case 1:
            let calculate = CalculatorViewController()
            self.navigationController?.pushViewController(calculate, animated: true)
            break
        case 2:
            let myCalculate = STCalculateController()
            self.navigationController?.pushViewController(myCalculate, animated: true)
            break
        case 3:
            let calculateString  = "1+(2+3546)×54="
            let calculate = CalculateResult()
            let result = calculate.calculateWithString(calculateString)
            print("计算结果为\(result)")
            break
        case 4:
            break
        default:
            break
        }
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
