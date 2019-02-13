//
//  ViewController.swift
//  Calculator
//
//  Created by Julien Shim on 2/11/19.
//  Copyright © 2019 Julien Shim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        display.text = "0";
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
                print("decimal")
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
//                print("all clear")
                display.text = "0"
            case 18:
                print("plus/negative")
            case 19:
                print("percent")
            default: ()
        }
        
    }
    
    func updateDisplay (value: String) {
        
        if (display.text == "0") {
            display.text = value
        } else {
            display.text! += value
        }

    }
    
}

