//
//  ViewController.swift
//  HelloPaises
//
//  Created by Chihau Chau on 15-11-16.
//  Copyright © 2016 Chihau Chau. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let paises = ["Argentina", "Brasil", "Bolivia", "Chile", "Colombia", "Ecuador", "Jamaica", "Paraguay", "Peru", "Mexico", "Uruguay", "Venezuela"]
    
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self;
        tableView.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Método definido en el protocolo UITableViewDataSource para retornar la cantidad de items que tiene nuestro UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paises.count
    }
    
    // Método definido en el protocolo UITableViewDataSource para poblar con datos nuestro UITableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath) as! DemoPrototypeCell

        cell.myLabel.text = paises[indexPath.row]
        return cell
    }
    
    // Éste método funciona si se implementa el protocolo UITableViewDelegate
    // Permite realizar alguna acción cuando se selecciona algún item de la lista
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Desselecciona el item
        tableView.deselectRow(at: indexPath, animated: true)
        // Imprimimos el item seleccionado en un log
        print("Se ha seleccionado: " + paises[indexPath.row])
    }

}

