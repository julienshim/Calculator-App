//
//  ViewController.swift
//  Calculator
//
//  Created by Julien Shim on 2/11/19.
//  Copyright © 2019 Julien Shim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var math = [String]()
    var temp = [String]()
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
        switch sender.tag {
            case 1:
                updateDisplay(value: "1");
            case 2:
                updateDisplay(value: "2");
            case 3:
                updateDisplay(value: "3");
            case 4:
                updateDisplay(value: "4");
            case 5:
                updateDisplay(value: "5");
            case 6:
                updateDisplay(value: "6");
            case 7:
                updateDisplay(value: "7");
            case 8:
                updateDisplay(value: "8");
            case 9:
                updateDisplay(value: "9");
            case 10:
                updateDisplay(value: "0");
            case 11:
                updateDisplay(value: ".")
            case 12:
                print("divide")
            case 13:
                print("multiply")
            case 14:
                print("subtract")
            case 15:
                addSubtract(value: display.text!, sign: "add")
            case 16:
                print("equals")
            case 17:
//                print("all clear")
                clear()
            case 18:
                plusNegative(value: display.text!, sign: "add")
            case 19:
                print("percent")
            default: ()
        }
        
    }
    
    func updateDisplay (value: String) {
        clearButtonDisplay.setTitle("C", for: UIControl.State.normal)
        if (fullStop == true) {
            display.text = value
            fullStop = false
        } else {
            display.text! += value
        }
    }
    
    func plusNegative (value: String, sign: String) {
        let flip = Int(value)! * -1
        display.text = String(flip)
    }
    
    func calculate (value: String, sign: String) {
        if (sign == "add") {
            return
        }
    }
    
    func clear() {
        clearButtonDisplay.setTitle("AC", for: UIControl.State.normal)
        display.text = "0"
    }
    
    func addSubtract(value: String, sign: String) {
        currentDisplay = display.text!
        fullStop = true
        temp.append(currentDisplay)
        temp.append(sign)
        print(temp)
    }
    
    func divideMultiply(value: String) {
        fullStop = true
    }
}
