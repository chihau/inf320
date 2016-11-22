//
//  ViewController.swift
//  ToDo
//
//  Created by Chihau Chau on 22-11-16.
//  Copyright © 2016 Chihau Chau. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    //var items = [String]()
    var items = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "To Do"
        
        // Se asignamos un identificador a la celda de la tableView para poder reutilizarla
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // Poblamos el tableView con los datos obtenidos desde la BD
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Reutilizamos la celda con el identificador "TableViewCell"
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath)
        
        // Obtenemos el valor del campo "desc"
        //tableViewCell.textLabel!.text = items[indexPath.row]
        tableViewCell.textLabel!.text = items[indexPath.row].value(forKey: "texto") as? String
        
        return tableViewCell
    }
    
    // Acción que ejecuta el botón "Add"
    @IBAction func addItem(_ sender: Any) {
        let alert = UIAlertController(title: "Nueva Tarea", message: "Agregar una nueva tarea", preferredStyle: .alert)
        
        // Definimos la acción "Guardar"
        let saveAction = UIAlertAction(title: "Guardar", style: .default) { (action: UIAlertAction!) -> Void in
            
            let textField = alert.textFields![0]
            
            //self.items.append(textField.text!)
            self.saveItem(texto: textField.text!)
            
            self.tableView.reloadData()
        }
        
        // Definimos la acción "Cancelar"
        let cancelAction = UIAlertAction(title: "Cancelar", style: .default) { (action: UIAlertAction!) -> Void in
            
        }
        
        // Agregamos el campo de texto de la alerta
        alert.addTextField {
            (textField: UITextField!) -> Void in
            //Aquí podríamos configurar el campo de texto antes de ser mostrado
        }
        
        // Agregamos los botones de la alerta
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        // Mostramos la ventana de Alerta
        present(alert, animated: true, completion: nil)
    }
    
    // Método para agregar datos a la BD
    func saveItem(texto: String) {
        // Primero debemos obtener el contexto de la aplicación
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Obtenemos una instancia de la entidad (tabla) de la BD
        let entity =  NSEntityDescription.entity(forEntityName: "Item", in: managedContext)
        let attribute = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        // Insertamos el nuevo valor en el campo "desc" de la table "TodoItem"
        attribute.setValue(texto, forKey: "texto")
        
        // Guardamos el cambio en la BD, sino se puede imprimimos un error
        do {
            try managedContext.save()
            items.append(attribute)
        } catch let error as NSError  {
            print("No se puede guardar el item \(error), \(error.userInfo)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Primero debemos obtener el contexto de la aplicación
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // NSFetchRequest es la clase que nos permite obtener los datos desde el CoreData framework
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        
        // Obtenemos los datos
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            items = results as! [NSManagedObject]
        } catch let error as NSError {
            print("No se pueden obtener los items guardados \(error), \(error.userInfo)")
        }
    }
    
}

