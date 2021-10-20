//
//  ViewController.swift
//  AutoLayoutSDK
//
//  Created by James Shen on 9/29/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let lbl1 = UILabel()
        lbl1.text = "First Name"
        lbl1.font = UIFont(name: "Arial", size: 36)
        lbl1.backgroundColor = .yellow
        lbl1.numberOfLines = 0
        view.addSubview(lbl1)
        
        let lbl2 = UILabel()
        lbl2.text = "Last Name"
        lbl2.backgroundColor = .green
        view.addSubview(lbl2)

        // 1. Reset a flag
        lbl1.translatesAutoresizingMaskIntoConstraints = false
        lbl2.translatesAutoresizingMaskIntoConstraints = false
        // 2. Define constraints
        let lc = lbl1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25)
        let tc = lbl1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        
        let lc1 = lbl2.leftAnchor.constraint(equalTo: lbl1.rightAnchor, constant: 15)
        let tc1 = lbl2.topAnchor.constraint(equalTo: lbl1.topAnchor)
        let rc1 = lbl2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25)
        let wc1 = lbl2.widthAnchor.constraint(equalTo: lbl1.widthAnchor, multiplier: 1.0)
        let hc1 = lbl2.heightAnchor.constraint(equalTo: lbl1.heightAnchor, multiplier: 1.0)

        // 3. Activate the constraints
        lc.isActive = true
        tc.isActive = true
        lc1.isActive = true
        tc1.isActive = true
        rc1.isActive = true
        wc1.isActive = true
        hc1.isActive = true
    }


}

