//
//  ViewController.swift
//  HelloAction
//
//  Created by Chihau Chau on 04-12-18.
//  Copyright © 2018 Chihau Chau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func ingresarTexto(_ sender: Any) {
        myLabel.text = myTextField.text
        myTextField.resignFirstResponder()
    }
    
}

