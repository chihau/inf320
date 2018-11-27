//
//  ViewController.swift
//  HelloLogin
//
//  Created by Chihau Chau on 27-11-18.
//  Copyright © 2018 Chihau Chau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func login(_ sender: Any) {
        print("Botón login presionado")
        loginLabel.text = "Sí ha iniciado sesión"
    }
}

