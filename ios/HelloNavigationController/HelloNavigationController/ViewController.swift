//
//  ViewController.swift
//  HelloNavigationController
//
//  Created by Chihau Chau on 10-11-16.
//  Copyright © 2016 Chihau Chau. All rights reserved.
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination
        
        if segue.identifier == "redSegue" {
            destinationVC.title = "Rojo"
            destinationVC.view.backgroundColor = UIColor.red
        } else if segue.identifier == "blueSegue" {
            destinationVC.title = "Azul"
            destinationVC.view.backgroundColor = UIColor.blue
        }
    }
}

