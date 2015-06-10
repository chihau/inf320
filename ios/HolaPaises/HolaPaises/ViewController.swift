//
//  ViewController.swift
//  HolaPaises
//
//  Created by Chihau Chau on 08-06-15.
//  Copyright (c) 2015 Chihau Chau. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let paises = ["Argentina", "Brasil", "Bolivia", "Chile", "Colombia", "Ecuador", "Jamaica", "Paraguay", "Peru", "Mexico", "Uruguay", "Venezuela"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // Método definido en el protocolo UITableViewDataSource para retornar la cantidad de items que tiene nuestro UITableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paises.count
    }
    
    // Método definido en el protocolo UITableViewDataSource para poblar con datos nuestro UITableView
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cl.chihau.holatableview.demoprototypecell", forIndexPath: indexPath) as! DemoPrototypeCell
        cell.myLabel.text = paises[indexPath.row]
        return cell
    }
    
    // Éste método funciona si se implementa el protocolo UITableViewDelegate
    // Permite realizar alguna acción cuando se selecciona algún item de la lista
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Desselecciona el item
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        // Imprimimos el item seleccionado en un log
        println("Se ha seleccionado: " + paises[indexPath.row])
    }
    
}

