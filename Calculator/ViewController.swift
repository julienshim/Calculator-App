//
//  ViewController.swift
//  Calculator
//
//  Created by Julien Shim on 2/11/19.
//  Copyright © 2019 Julien Shim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
            case 1:
                print("one")
            case 2:
                print("two")
            case 3:
                print("three")
            case 4:
                print("four")
            case 5:
                print("five")
            case 6:
                print("six")
            case 7:
                print("seven")
            case 8:
                print("eight")
            case 9:
                print("nine")
            case 10:
                print("zero")
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
                print("all clear")
            case 18:
                print("plus/negative")
            case 19:
                print("percent")
            default: ()
        }
        
    }
    
}

