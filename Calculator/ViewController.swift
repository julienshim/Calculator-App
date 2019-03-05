//
//  ViewController.swift
//  Calculator
//
//  Created by Julien Shim on 2/11/19.
//  Copyright © 2019 Julien Shim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentDisplay: String = "0"
    var isOpPressed: Bool = false
    var isNewDisplay: Bool = true
    var lastPressed: String = "num"
    var currentCalculation = [String]()
    var master : Double = 0.0
    var continuation = false;
    var continuationValue = 0;
    var continuationOp = ""
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var clearButtonDisplay: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        display.text = String(0);
        print(master, currentCalculation, lastPressed)
    }

    @IBAction func pressNum(_ sender: UIButton) {
        continuation = false;
        isOpPressed = false
        lastPressed = "num"
        switch Int(sender.tag) {
            case 1:
                updateDisplay(value: String(sender.tag));
            case 2:
                updateDisplay(value: String(sender.tag));
            case 3:
                updateDisplay(value: String(sender.tag));
            case 4:
                updateDisplay(value: String(sender.tag));
            case 5:
                updateDisplay(value: String(sender.tag));
            case 6:
                updateDisplay(value: String(sender.tag));
            case 7:
                updateDisplay(value: String(sender.tag));
            case 8:
                updateDisplay(value: String(sender.tag));
            case 9:
                updateDisplay(value: String(sender.tag));
            case 10:
                updateDisplay(value: String(0));
            case -1:
                updateDisplay(value: ".")
            default: ()
        }

    }
    
    
    @IBAction func pressPosNeg(_ sender: UIButton) {
        display.text = String(Int(display.text!)! * -1)
    }
    
    @IBAction func pressOp(_ sender: UIButton) {
        continuation = false;
        isOpPressed = true
        isNewDisplay = true
        if (lastPressed == "num" || lastPressed == "clear") {
            if (master == 0) {
                master = Double(display.text!)!
            } else if (currentCalculation.count % 2 == 1) {
                currentCalculation.append(display.text!)
            }
            switch Int(sender.tag) {
            case 11:
                currentCalculation.append("divide")
            case 12:
                currentCalculation.append("multiply")
            case 13:
                currentCalculation.append("subtract")
            case 14:
                currentCalculation.append("add")
            default: ()
            }
        } else if (lastPressed == "op") {
            switch Int(sender.tag) {
            case 11:
                continuationOp = "divide"
                if(currentCalculation.count > 1) {
                    currentCalculation.removeLast()
                    currentCalculation.append("divide")
                } else {
                    currentCalculation = [String]()
                    currentCalculation.append("divide")
                }
            case 12:
                continuationOp = "multiply"
                if(currentCalculation.count > 1) {
                    currentCalculation.removeLast()
                    currentCalculation.append("multiply")
                } else {
                    currentCalculation = [String]()
                    currentCalculation.append("multiply")
                }
            case 13:
                continuationOp = "subtract"
                if(currentCalculation.count > 1) {
                    currentCalculation.removeLast()
                    currentCalculation.append("subtract")
                } else {
                    currentCalculation = [String]()
                    currentCalculation.append("subtract")
                }
            case 14:
                continuationOp = "add"
                if(currentCalculation.count > 1) {
                    currentCalculation.removeLast()
                    currentCalculation.append("add")
                } else {
                    currentCalculation = [String]()
                    currentCalculation.append("add")
                }
            default: ()
            }
        }
        lastPressed = "op"
        print(master, currentCalculation, lastPressed)
        if (currentCalculation.count > 2) {
            calculate(m: master, cC: currentCalculation)
        }
    }
    
    
    @IBAction func equalPressed(_ sender: UIButton) {
       
        if(lastPressed == "op" && continuation == true) {
            if (currentCalculation.count == 1) {
                if (lastPressed != "equal") {
                    continuationValue = Int(master)
                }
                currentCalculation.append(String(continuationValue));
                currentCalculation.append(currentCalculation[0])
            }
        } else if (lastPressed == "num") {
            continuationValue = Int(display.text!)!
            continuationOp = currentCalculation[0];
            currentCalculation.append(display.text!)
            currentCalculation.append("equal");
            print(continuationValue, continuationOp, currentCalculation)
        } else if (lastPressed == "clear") {
            
        } else if (lastPressed == "equal") {
            currentCalculation = [continuationOp, String(continuationValue), "equal"]
            print(currentCalculation);
        }
        lastPressed = "equal"
        isNewDisplay = true
        continuation = true;
        calculate(m: master, cC: currentCalculation)
        print(master, currentCalculation, lastPressed)
    }
    
    
    @IBAction func pressClear(_ sender: UIButton) {

        if (clearButtonDisplay.currentTitle == "C") {
            clearButtonDisplay.setTitle("AC", for: UIControl.State.normal)
            if (currentCalculation.count > 1) {
                if (lastPressed == "op") {
                    currentCalculation.removeLast()
                } else if (lastPressed == "num") {
                    display.text = String(0)
                }

            } else {
                if (lastPressed == "num") {
                    display.text = String(0)
                } else {
                    currentCalculation = [String]()
                }
            }
        } else {
            display.text = String(0)
            currentCalculation = [String]()
            master = 0.0
        }
        lastPressed = "clear"
        isNewDisplay = true
        continuation = false
        continuationValue = 0;
        print(master, currentCalculation, lastPressed)
    }
    
    
    func updateDisplay (value: String) {
        clearButtonDisplay.setTitle("C", for: UIControl.State.normal)
        if (lastPressed == "clear" || isNewDisplay || display.text == String(0)) {
            if (value == ".") {
                display.text! += value;
            } else {
                display.text = value;
            }
            isNewDisplay = false
        } else {
            display.text! += value
        }
    }
    
    func calculate (m: Double, cC: [String]){
        let op1 = cC[0]
        let num1 = cC[1]
        let op2 = cC[2]
        
        if (op1 == "multiply") {
            master = m * Double(num1)!
            if (op2 == "equal") { currentCalculation = [] } else {currentCalculation = [op2] }
               updateDisplay(value: String(format: "%g", master))
        } else if (op1 == "divide") {
            master = m / Double(num1)!
            updateDisplay(value: String(format: "%g", master))
            if (op2 == "equal") { currentCalculation = [] } else {currentCalculation = [op2] }
        } else if (op1 == "add") {
            if (op2 == "add" || op2 == "subtract") {
                master = m + Double(num1)!
                updateDisplay(value: String(format: "%g", master))
                if (op2 == "equal") { currentCalculation = [] } else {currentCalculation = [op2] }
            } else if (currentCalculation.count == 5) {
                let num2 = cC[3]
                let op3 = cC[4]
                if (op2 == "multiply") {
                    master = m + Double(num1)! * Double(num2)!
                    if (op3 == "equal") { currentCalculation = [] } else {currentCalculation = [op3] }
                } else if (op2 == "divide") {
                    master = m + Double(num1)! / Double(num2)!
                    updateDisplay(value: String(format: "%g", master))
                    if (op3 == "equal") { currentCalculation = [] } else {currentCalculation = [op3] }
                }
                updateDisplay(value: String(format: "%g", master))
            }
        } else if (op1 == "subtract") {
            if (op2 == "add" || op2 == "subtract") {
                master = m - Double(num1)!
                currentCalculation = [op2]
                updateDisplay(value: String(format: "%g", master))
            } else if (currentCalculation.count == 5) {
                let num2 = cC[3]
                let op3 = cC[4]
                if (op2 == "multiply") {
                    master = m - Double(num1)! * Double(num2)!
                    currentCalculation = [op3]
                } else if (op2 == "divide") {
                    master = m - Double(num1)! / Double(num2)!
                    currentCalculation = [op3]
                }
                updateDisplay(value: String(format: "%g", master))

            }
        }

        isNewDisplay = true
        print(master, currentCalculation)
        
    }

}
