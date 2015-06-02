//
//  ViewController.swift
//  HelloAction
//
//  Created by Chihau Chau on 01-06-15.
//  Copyright (c) 2015 Chihau Chau. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ingresarTexto(sender: AnyObject) {
        myLabel.text = myTextField.text
        myTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(userText: UITextField) -> Bool {
        myLabel.text = myTextField.text
        userText.resignFirstResponder()
        return true;
    }

}

