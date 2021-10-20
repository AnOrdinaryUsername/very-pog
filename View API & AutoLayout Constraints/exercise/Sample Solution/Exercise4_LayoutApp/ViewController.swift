//
//  ViewController.swift
//  Exercise4_LayoutApp
//
//  Created by James Shen on 10/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var xConstraint : NSLayoutConstraint!
    @IBOutlet var yConstraint : NSLayoutConstraint!
    
    var xDistance : Int = 0
    var yDistance : Int = 0
    
    @IBAction func westBtnClicked(_ sender: UIButton) {
        xDistance -= 5
        xConstraint.constant = CGFloat(xDistance)
    }
    
    @IBAction func eastBtnClicked(_ sender: UIButton) {
        xDistance += 5
        xConstraint.constant = CGFloat(xDistance)
    }
    
    @IBAction func northBtnClicked(_ sender: UIButton) {
        yDistance -= 5
        yConstraint.constant = CGFloat(yDistance)
    }
    
    @IBAction func southBtnClicked(_ sender: UIButton) {
        yDistance += 5
        yConstraint.constant = CGFloat(yDistance)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

