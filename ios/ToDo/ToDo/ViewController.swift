//
//  ViewController.swift
//  ToDo
//
//  Created by Chihau Chau on 08-06-15.
//  Copyright (c) 2015 Chihau Chau. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var items: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "To Do"
        
        // Se asignamos un identificador a la celda de la tableView para poder reutilizarla
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Primero debemos obtener el contexto de la aplicación
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        // NSFetchRequest es la clase que nos permite obtener los datos desde el CoreData framework
        let fetchRequest = NSFetchRequest(entityName:"TodoItem")
        
        // Creamos una variable que puede guardar errores
        var error: NSError?
        
        // Obtenemos los datos
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        // Si no hay datos imprimimos un error
        if let results = fetchedResults {
            items = results
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // Poblamos el tableView con los datos obtenidos desde la BD
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = self.items[indexPath.row]
        
        // Reutilizamos la celda con el identificador "TableViewCell"
        let tableViewCell = tableView.dequeueReusableCellWithIdentifier("TableViewCell", forIndexPath: indexPath) as! UITableViewCell
        
        // Obtenemos el valor del campo "desc"
        tableViewCell.textLabel?.text = item.valueForKey("desc") as? String
        
        return tableViewCell
    }

    // Acción que ejecuta el botón "Add" 
    @IBAction func addName(sender: AnyObject) {
        var alert = UIAlertController(title: "Nueva Tarea", message: "Agregar una nueva tarea", preferredStyle: .Alert)
        
        // Definimos la acción "Guardar"
        let saveAction = UIAlertAction(title: "Guardar", style: .Default) { (action: UIAlertAction!) -> Void in
                
                let textField = alert.textFields![0] as! UITextField
                self.saveName(textField.text)
                self.tableView.reloadData()
        }
        
        // Definimos la acción "Cancelar"
        let cancelAction = UIAlertAction(title: "Cancelar", style: .Default) { (action: UIAlertAction!) -> Void in
            
        }
        
        // Agregamos el campo de texto de la alerta
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField!) -> Void in
            //Aquí podrimos configurar el campo de texto antes de ser mostrado
        }
        
        // Agregamos los botones de la alerta
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        // Mostramos la ventana de Alerta
        presentViewController(alert, animated: true, completion: nil)
    }
    
    // Método para agregar datos a la BD
    func saveName(txt: String) {
        // Primero debemos obtener el contexto de la aplicación
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        // Obtenemos una instancia de la entidad (tabla) de la BD
        let entity =  NSEntityDescription.entityForName("TodoItem", inManagedObjectContext: managedContext)
        let desc = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        // Insertamos el nuevo valor en el campo "desc" de la table "TodoItem"
        desc.setValue(txt, forKey: "desc")
        
        // Guardamos el cambio en la BD, sino se puede imprimimos un error
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }  
        
        // Agregamos un item nuevo a la tableView
        items.append(desc)
    }
}

