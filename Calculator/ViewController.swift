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
    var lastPressed: String = "clear"
    var currentCalculation = [String]()
    var master: Double = 0.0
    var continuation = false;
    var continuationValue: Double = 0.0;
    var continuationOp = ""
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var clearButtonDisplay: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        display.text = String(0);
    }
    
    @IBAction func pressNum(_ sender: UIButton) {
              print("pressing num")
        continuation = false
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
        diog()
        isNewDisplay = false;

    }
    
    @IBAction func pressPercent(_ sender: UIButton) {
              print("pressing percent")
        display.text = String(Double(display.text!)! * 0.01)
        diog()
    }
    
    @IBAction func pressPosNeg(_ sender: UIButton) {
              print("pressing pos/neg")
        display.text = String(Double(display.text!)! * -1)
        diog()
    }
    
    @IBAction func pressOp(_ sender: UIButton) {
              print("pressing op")
        continuation = false;
        isOpPressed = true
        isNewDisplay = true
        if (lastPressed == "num" || lastPressed == "clear" || lastPressed == "equal") {
            if (master == 0) {
                master = Double(display.text!)!
            } else if (currentCalculation.count % 2 == 1) {
                currentCalculation.append(display.text!)
            }
            switch Int(sender.tag) {
            case 11:
                continuationOp = "divide"
                currentCalculation.append("divide")
            case 12:
                continuationOp = "multiply"
                currentCalculation.append("multiply")
            case 13:
                continuationOp = "subtract"
                currentCalculation.append("subtract")
            case 14:
                continuationOp = "add"
                currentCalculation.append("add")
            default: ()
            }
        } else if (lastPressed == "op") {
            switch Int(sender.tag) {
            case 11:
                updateOp(op: "divide")
            case 12:
                updateOp(op: "multiply")
            case 13:
                updateOp(op: "subtract")
            case 14:
                updateOp(op: "add")
            default: ()
            }
        }
        lastPressed = "op"
        if (currentCalculation.count > 2) {
            calculate(m: master, cC: currentCalculation)
        }
        diog()
    }
    
    func updateOp (op: String) {
              print("updating op")
        continuationOp = op
        isNewDisplay = true
        if(currentCalculation.count > 1) {
            currentCalculation.removeLast()
            currentCalculation.append(op)
        } else {
            currentCalculation = [op]
        }
    }
    
    
    @IBAction func equalPressed(_ sender: UIButton) {
              print("pressing equal")
        if(lastPressed == "op") {
            if (currentCalculation.count == 3) {
                currentCalculation.append("equal")
                calculate(m: master, cC: currentCalculation)
            } else {
                continuationValue = Double(master)
                continuationOp = currentCalculation[0]
                equalCalc(op: continuationOp)
            }
        } else if (lastPressed == "num" && currentCalculation != []) {
            continuationValue = Double(display.text!)!
            currentCalculation.append(display.text!)
            currentCalculation.append("equal");
            calculate(m: master, cC: currentCalculation)
        } else if (lastPressed == "equal") {
            equalCalc(op: continuationOp)
        } else if (currentCalculation == [] || lastPressed == "clear") {
            master = Double(display.text!)!
            updateDisplay(value: String(format: "%g", master))
        }
        lastPressed = "equal"
        isNewDisplay = true
        continuation = true;
        diog()
    }
    
    
    @IBAction func pressClear(_ sender: UIButton) {
              print("pressing clear")
        if (lastPressed == "equal") {
            currentCalculation = [];
            master = 0.0
            updateDisplay(value: String(format: "%g", master))
            clearButtonDisplay.setTitle("AC", for: UIControl.State.normal)
        } else if (clearButtonDisplay.currentTitle == "C") {
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
                    currentCalculation = []
                }
            }
        } else {
            display.text = String(0)
            currentCalculation = []
            master = 0.0
        }
        lastPressed = "clear"
        isNewDisplay = true
        continuation = false
        continuationValue = 0;
        diog()
    }
    
    
    func updateDisplay (value: String) {
        print("updating display")
        clearButtonDisplay.setTitle("C", for: UIControl.State.normal)
        if (lastPressed == "clear" || isNewDisplay) {
             print("D")
            if (value == ".") {
                if (display.text == String(0)) {
                    display.text! = String(0) + value
                    print("B")
                } else {
                    if (value == ".") {
                        display.text! = String(0) + value
                    } else {
                        display.text! = value
                    }
                    
                    print("FUCKER")
                }
            } else {
                 print("E")
                if (value == "nan" || value == "inf") {
                     print("F")
                    display.text = "Not a number"
                    clearButtonDisplay.setTitle("AC", for: UIControl.State.normal)
                } else {
                    display.text = value
                     print("G")
                }
            }
        } else {
            display.text! += value
            print("h")
        }
        diog()
    }
    
    func calculate (m: Double, cC: [String]){
        print("calculate")
        let op1 = cC[0]
        isNewDisplay = true
        
        if (op1 == "equal") {
            equalCalc(op: continuationOp)
        } else {
            let num1 = cC[1]
            let op2 = cC[2]
            
            if (op1 == "multiply") {
                master = m * Double(num1)!
                if (op2 == "equal") { currentCalculation = ["equal"] } else {currentCalculation = [op2] }
                updateDisplay(value: String(format: "%g", master))
            } else if (op1 == "divide") {
                master = m / Double(num1)!
                if (op2 == "equal") { currentCalculation = ["equal"] } else {currentCalculation = [op2] }
                updateDisplay(value: String(format: "%g", master))
            } else if (op1 == "add") {
                if (op2 == "add" || op2 == "subtract" || op2 == "equal") {
                    master = m + Double(num1)!
                    updateDisplay(value: String(format: "%g", master))
                    currentCalculation = [op2]
                } else if (currentCalculation.count == 4) {
                    master = Double(currentCalculation[1])! * master + Double(currentCalculation[1])!
                    continuationOp = currentCalculation[2]
                    continuationValue = Double(currentCalculation[1])!
                    currentCalculation = [currentCalculation[3]]
                    lastPressed = "equal"
                    updateDisplay(value: String(format: "%g", master))
                } else if (currentCalculation.count == 5) {
                    let num2 = cC[3]
                    let op3 = cC[4]
                    if (op2 == "multiply") {
                        master = m + Double(num1)! * Double(num2)!
                        if (op3 == "equal") { currentCalculation = ["equal"] } else {currentCalculation = [op3] }
                    } else if (op2 == "divide") {
                        master = m + Double(num1)! / Double(num2)!
                        if (op3 == "equal") { currentCalculation = ["equal"] } else {currentCalculation = [op3] }
                    }
                    updateDisplay(value: String(format: "%g", master))
                }
            } else if (op1 == "subtract") {
                if (op2 == "add" || op2 == "subtract" || op2 == "equal") {
                    master = m - Double(num1)!
                    updateDisplay(value: String(format: "%g", master))
                    currentCalculation = [op2]
                } else if (currentCalculation.count == 4) {
                    master = Double(currentCalculation[1])! * master - Double(currentCalculation[1])!
                    continuationOp = currentCalculation[2]
                    continuationValue = Double(currentCalculation[1])!
                    currentCalculation = [currentCalculation[3]]
                    lastPressed = "equal"
                    updateDisplay(value: String(format: "%g", master))
                } else if (currentCalculation.count == 5) {
                    let num2 = cC[3]
                    let op3 = cC[4]
                    if (op2 == "multiply") {
                        master = m - Double(num1)! * Double(num2)!
                        if (op3 == "equal") { currentCalculation = [] } else {currentCalculation = [op3] }
                    } else if (op2 == "divide") {
                        master = m - Double(num1)! / Double(num2)!
                        if (op3 == "equal") { currentCalculation = [] } else {currentCalculation = [op3] }
                    }
                    updateDisplay(value: String(format: "%g", master))
                    
                }
            }
        }
        
  diog()
        
    }
    
    func equalCalc (op: String) {
              print("equal calculate")
        if (op == "add") {
            master = master + Double(continuationValue)
            currentCalculation = ["equal"]
            updateDisplay(value: String(format: "%g", master))
        } else if (op == "subtract") {
            master = master - Double(continuationValue)
            currentCalculation = ["equal"]
            updateDisplay(value: String(format: "%g", master))
        } else if (op == "multiply") {
            master = master * Double(continuationValue)
            currentCalculation = ["equal"]
            updateDisplay(value: String(format: "%g", master))
        } else if (op == "divide") {
            master = master / Double(continuationValue)
            currentCalculation = ["equal"]
            updateDisplay(value: String(format: "%g", master))
        }
        diog()
    }
    
    func diog() {
        print("master", master, "currentCalculation", currentCalculation, "lastPressed", lastPressed)
        print("isNewDisplay", isNewDisplay)
    }
    
}
