//
//  ViewController.swift
//  ViewApiApp
//
//  Created by James Shen on 9/22/21.
//

import UIKit

class ViewController: UIViewController {

    @objc func btnClicked(_ sender: UIButton) {
        print("The 'Click Me' button is clicked.")
        /*
        cnt += 1
        labelObj.text = "No. of btn clicks: \(cnt)"
         */
        labelObj.text = tFldObj.text
        labelObj.sizeToFit()
        sender.frame.origin.x = labelObj.frame.origin.x + labelObj.frame.size.width + 5
        sender.frame.origin.y = labelObj.frame.origin.y
    }

    var cnt : Int = 0
    var labelObj : UILabel!
    var tFldObj : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // pts instead of pixels
        // UILabel
        let label = UILabel(frame: CGRect(x: 10, y: 20, width: 200, height: 30))
        label.text = "Initial String"
        label.backgroundColor = UIColor.yellow
        label.textColor = .blue
        //
        let font = UIFont(name: "Arial-BoldItalicMT", size: 24.0)
        label.font = font
        label.sizeToFit()
        view.addSubview(label)
        //
        labelObj = view.subviews[0] as? UILabel
        
        // UIButton
        let btn = UIButton()
        btn.setTitle("Click Me", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.backgroundColor = .yellow
        btn.sizeToFit()
        btn.frame.size.height = label.frame.size.height
        btn.frame.origin.x = label.frame.origin.x + label.frame.size.width + 5
        btn.frame.origin.y = label.frame.origin.y
        
        btn.addTarget(self, action: #selector(btnClicked(_:)), for: .touchUpInside)
        
        view.addSubview(btn)
        
        let txtFld = UITextField()
        txtFld.placeholder = "Please enter input text"
        txtFld.backgroundColor = .cyan
        txtFld.sizeToFit()
        txtFld.frame.origin.x = 10
        txtFld.frame.origin.y = 80
        view.addSubview(txtFld)
        tFldObj = view.subviews[2] as? UITextField
    }

}

