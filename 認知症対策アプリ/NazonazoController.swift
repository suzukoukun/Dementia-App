//
//  NazonazoController.swift
//  認知症対策アプリ
//
//  Created by スズコー on 2016/07/17.
//  Copyright © 2016年 スズコー. All rights reserved.
//

import Foundation
import UIKit

class NazonazoController: UIViewController{
    
    var quizArray = [[AnyObject]]()
    
    //正解数
    var correctAnswer:Int = 0
    
    
    //クイズを表示するTextView
    @IBOutlet var NazonazoTextView: UITextView!
    
    //まるばつラベルを3つ宣言
    //つかれたねむいけどやらなきゃあああ
    @IBOutlet var marubatsuLabel1: UILabel!
    @IBOutlet var marubatsuLabel2: UILabel!
    @IBOutlet var marubatsuLabel3: UILabel!
    
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tmpArray = [[AnyObject]]()
        
        
        
        //------------------------ここから下にクイズを書く------------------------//
        tmpArray.append(["紙を食べるがやぎではない。鼻も目もない口一つって何？" as AnyObject,"郵便局" as AnyObject,"ポスト" as AnyObject,"動物園" as AnyObject,2 as AnyObject])
        tmpArray.append(["ばい菌をやっつける「けん」ってどんな「けん」？" as AnyObject,"せっけん" as AnyObject,"どうけん" as AnyObject,"けんしょう" as AnyObject,1 as AnyObject])
        tmpArray.append(["冷蔵庫の中にいる動物は？" as AnyObject,"キリン" as AnyObject,"ゾウ" as AnyObject,"ライオン" as AnyObject,2 as AnyObject])
        tmpArray.append(["予行演習の時にいるサルって、何？" as AnyObject,"フットサル" as AnyObject,"サル練習" as AnyObject,"リハーサル" as AnyObject,3 as AnyObject])
        tmpArray.append(["読んでいると、体がビリビリしびれてくる本の種類とはどんな本？" as AnyObject,"伝記" as AnyObject,"回線" as AnyObject,"懐中電灯" as AnyObject,1 as AnyObject])
        tmpArray.append(["柔道や剣道が好きな人が好む果物は何？" as AnyObject,"もも" as AnyObject,"ドリアン" as AnyObject,"ブドウ" as AnyObject,3 as AnyObject])
        //------------------------ここから上にクイズを書く------------------------//
        
        // 問題をシャッフルしてquizArrayに格納する
        while (tmpArray.count > 0) {
            let index = Int(arc4random_uniform(UInt32(tmpArray.count)))
            quizArray.append(tmpArray[index])
            tmpArray.remove(at :index)
        }
        choiceQuiz()
    }
    
    func choiceQuiz() {
        
        marubatsuLabel1.text = ""
        marubatsuLabel2.text = ""
        marubatsuLabel3.text = ""
        
        NazonazoTextView.text = quizArray[0][0] as! String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, for: .normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, for: .normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, for: .normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        marubatsuLabel1.text = "❌"
        marubatsuLabel2.text = "❌"
        marubatsuLabel3.text = "❌"
        
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer += 1
        }
        if quizArray[0][4] as! Int == 1 {
            marubatsuLabel1.text = "⭕️"
        } else if quizArray[0][4] as! Int == 2 {
            marubatsuLabel2.text = "⭕️"
        } else if quizArray[0][4] as! Int == 3 {
            marubatsuLabel3.text = "⭕️"
            
        }
        RunLoop.main.run(until: NSDate(timeIntervalSinceNow:0.5) as Date)
        
        quizArray.remove(at :0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
          performSegue(withIdentifier: "Nazofinish", sender: nil)
   
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Nazofinish") {
            
            print(correctAnswer)
            
            let resultView = segue.destination as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
}


