//
//  ViewController.swift
//  ViewAutoLayou_IB
//
//  Created by James Shen on 9/29/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstName : UITextField!
    @IBOutlet var outputLabel : UILabel!
    
    @IBAction func btnClicked(_ sender: UIButton) {
        if let outStr = firstName.text {
            print("First Name entered: \(outStr)")
            outputLabel.text = "First Name entered: \(outStr)"
        } else {
            outputLabel.text = "Nothing was entered"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

