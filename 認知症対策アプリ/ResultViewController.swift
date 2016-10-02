//
//  ResultViewController.swift
//  認知症対策アプリ
//
//  Created by スズコー on 2016/07/17.
//  Copyright © 2016年 スズコー. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var correctAnswer:Int = 0
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //正解数が6以上のときに
        if correctAnswer >= 6 {
            //文字色を赤色にする
            resultLabel.textColor = UIColor.red
        }
        resultLabel.text = "\(correctAnswer)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
