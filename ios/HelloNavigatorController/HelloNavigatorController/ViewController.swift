//
//  ViewController.swift
//  HelloNavigatorController
//
//  Created by Chihau Chau on 24-05-15.
//  Copyright (c) 2015 Chihau Chau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! UIViewController
        if segue.identifier == "redSegue" {
            destinationVC.title = "Rojo"
            destinationVC.view.backgroundColor = UIColor.redColor()
        } else if segue.identifier == "blueSegue" {
            destinationVC.title = "Azul"
            destinationVC.view.backgroundColor = UIColor.blueColor()
        }
    }


}

