//
//  ViewController.swift
//  HelloImageView
//
//  Created by Chihau Chau on 22-11-16.
//  Copyright © 2016 Chihau Chau. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController();
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Seteamos para que nuestro View Controller sea el delegado del UIImagePickerController
        imagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openPhotoLibrary(_ sender: Any) {
        // Deshabilitamos la posibilidad de que el usuario edite la foto
        imagePicker.allowsEditing = false;
        
        // Indicamos que la foto la sacaremos la galería, otras opciones del enum son .savedPhotosAlbum y .camera
        imagePicker.sourceType = .photoLibrary
        
        // Mostramos el Image Picker Controller
        present(imagePicker, animated: true, completion: nil)
    }
    
    // Método del protocolo UIImagePickerControllerDelegate que le indica al delegado que el usuario ya ha seleccionado una foto
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : Any]) {

        let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        // Para que la foto se ajuste al tamaño definido para el ImageView
        imageView.contentMode = .scaleAspectFit
        imageView.image = pickedImage
        
        // Escondemos el Image Picker Controller
        dismiss(animated: true, completion: nil)
    }
    
    // Método del protocolo UIImagePickerControllerDelegate que le indica al delegado que el usuario canceló la selección
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
