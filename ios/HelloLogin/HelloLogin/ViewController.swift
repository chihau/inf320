//
//  ViewController.swift
//  HelloLogin
//
//  Created by Chihau Chau on 08-11-16.
//  Copyright © 2016 Chihau Chau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // ! (implicitly unwrapped optional) es para indicar que yo sé que la
    // variable contiene un valor que NO es nulo
    @IBOutlet weak var loginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: Any) {
        print("Botón login presionado")
        loginLabel.text = "Sí ha iniciado sesión"
    }

}

