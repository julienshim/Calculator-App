//
//  ViewController.swift
//  Calculator
//
//  Created by Julien Shim on 2/11/19.
//  Copyright © 2019 Julien Shim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var math = [Int]()
    var temp = [Any]()
    var fullStop : Bool = true
    var currentDisplay : String = ""
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var clearButtonDisplay: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        display.text = "0"
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        switch Int(sender.tag) {
            case 1:
                updateDisplay(value: 1);
            case 2:
                updateDisplay(value: 2);
            case 3:
                updateDisplay(value: 3);
            case 4:
                updateDisplay(value: 4);
            case 5:
                updateDisplay(value: 5);
            case 6:
                updateDisplay(value: 6);
            case 7:
                updateDisplay(value: 7);
            case 8:
                updateDisplay(value: 8);
            case 9:
                updateDisplay(value: 9);
            case 10:
                updateDisplay(value: 0);
            case 11:
                updateDisplay(value: ".")
            case 12:
                print("divide")
            case 13:
                print("multiply")
            case 14:
                print("subtract")
            case 15:
                print("add")
            case 16:
                print("equals")
            case 17:
                print("what's up")
                whatTheFuck()
            case 18:
                print("plus negative")
            case 19:
                print("percent")
            default: ()
        }
        
    }
    
    func updateDisplay (value: Any) {
        clearButtonDisplay.setTitle("C", for: UIControl.State.normal)
        if (fullStop == true || display.text == "0") {
            display.text! = value as! String
            fullStop = false
        } else {
            display.text! += value as! String
        }
    }
//
//    func plusNegative (value: String, sign: String) {
//        let flip = Int(value)! * -1
//        display.text = String(flip)
//    }
//
//    func calculate (value: String, sign: String) {
//        if (sign == "add") {
//            return
//        }
//    }
//
    func whatTheFuck() {
        clearButtonDisplay.setTitle("AC", for: UIControl.State.normal)
        display.text = "0"
        math = [Int]()
    }
//
//    func addSubtract(value: String, sign: String) {
//        currentDisplay = display.text!
//        fullStop = true
//        temp.append(currentDisplay)
//
//        if (temp[0] == "add" || temp[0] == "subtract") {
//            math = math + Int(temp[1])
//        }
//        temp.append(sign)
//    }
//
//    func divideMultiply(value: String) {
//        fullStop = true
//    }
}
