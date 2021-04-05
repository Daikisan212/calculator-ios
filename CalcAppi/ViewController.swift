//
//  ViewController.swift
//  CalcAppi
//
//  Created by seito on 2020/06/01.
//  Copyright © 2020 seito. All rights reserved.
//

import UIKit

class ViewController: UIViewController { //初期化
    var num = 0
    var numFlg = false
    var opeStr = " "
    var zero = true
    
    @IBOutlet weak var ans: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickNum(_ sender: Any) {
        let button:UIButton = sender as! UIButton
        let str:String = button.titleLabel!.text!
        if zero || !numFlg {
            ans.text = str
            zero = false
        }
        else{
            ans.text! += str
        }
        if Int(ans.text!) != 0{
            numFlg = true
        }
    }
    
    
    @IBAction func clickEqual(_ sender: Any) {
        if numFlg{
            switch(opeStr){
            case "+": num += Int(ans.text!)!
            case "-": num -= Int(ans.text!)!
            case "×": num *= Int(ans.text!)!
            case "÷": num /= Int(ans.text!)!
            default : num =  Int(ans.text!)!
            }
            opeStr = " "
            ans.text = String(num)
            
        }
    }
    
    @IBAction func clickOpe(_ sender: Any) {
        if opeStr != " " && numFlg{
            switch(opeStr){
            case "+": num += Int(ans.text!)!
            case "-": num -= Int(ans.text!)!
            case "×": num *= Int(ans.text!)!
            case "÷": num /= Int(ans.text!)!
            default : num =  Int(ans.text!)!
            }
            
            ans.text = String(num)
        }
        print("***\(ans.text!)***")
        num  = Int(ans.text!)!
        zero = true
        let button:UIButton = sender as! UIButton
        opeStr = button.titleLabel!.text!
        numFlg = false
    }
    
    @IBAction func clickClear(_ sender: Any) {
        num = 0
        numFlg = false
        zero = true
        ans.text  = "0"
    }
}

