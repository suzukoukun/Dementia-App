//
//  TapController.swift
//  認知症対策アプリ
//
//  Created by スズコー on 2016/07/03.
//  Copyright © 2016年 スズコー. All rights reserved.
//


import Foundation


import UIKit

class TapController: UIViewController {
    
    var number: Int = 0
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func plus() {
        number = number + 1
        label.text = String(number)
        
        if number == 10{
        performSegue(withIdentifier: "finish", sender: nil)
        }
        
    }
}

