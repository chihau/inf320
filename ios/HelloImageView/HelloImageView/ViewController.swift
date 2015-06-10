//
//  ViewController.swift
//  HelloImageView
//
//  Created by Chihau Chau on 10-06-15.
//  Copyright (c) 2015 Chihau Chau. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Seteamos para que nuestro View Controller sea el delegado del UIImagePickerController
        imagePicker.delegate = self
    }
    
    // Acción que se ejecuta al presionar el botón
    @IBAction func abrirPhotoLibrary(sender: AnyObject) {
        // Deshabilitamos la posibilidad de que el usuario edite la foto
        imagePicker.allowsEditing = false
        // Indicamos que la foto la sacaremos la galería
        imagePicker.sourceType = .PhotoLibrary
        // Mostramos el Image Picker Controller
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    // Método del protocolo UIImagePickerControllerDelegate que le indica al delegado que el usuario ya ha seleccionado una foto
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // Para que la foto se ajuste al tamaño definido para el ImageView
            imageView.contentMode = .ScaleAspectFit
            imageView.image = pickedImage
        }
        
        // Escondemos el Image Picker Controller
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Método del protocolo UIImagePickerControllerDelegate que le indica al delegado que el usuario canceló la selección
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Escondemos el Image Picker Controller
        dismissViewControllerAnimated(true, completion: nil)
    }
}

