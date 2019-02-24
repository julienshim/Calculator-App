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
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var clearButtonDisplay: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        display.text = String(0);
    }

    @IBAction func pressNum(_ sender: UIButton) {
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
            case 11:
                updateDisplay(value: ".")
            default: ()
        }
    }
    
    @IBAction func pressOp(_ sender: UIButton) {
        switch Int(sender.tag) {
            case 11:
                print("divide")
                isOpPressed = true
            case 12:
                print("multiply")
                isOpPressed = true
            case 13:
                print("subtract")
                isOpPressed = true
            case 14:
                print("add")
                isOpPressed = true
            default: ()
        }
    }
    
    
    @IBAction func pressClear(_ sender: UIButton) {
        print("clear")
    }
    
    
    func updateDisplay (value: String) {
        clearButtonDisplay.setTitle("C", for: UIControl.State.normal)
        if (display.text == String(0)) {
            display.text = value
        } else {
            display.text! += value
        }
    }

}
