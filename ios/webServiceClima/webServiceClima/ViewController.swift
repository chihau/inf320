//
//  ViewController.swift
//  webServiceClima
//
//  Created by Chihau Chau on 18-08-15.
//  Copyright (c) 2015 Chihau Chau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var capturaTexto: UITextField!
    @IBOutlet weak var labelClima: UILabel!
    @IBOutlet weak var imagenClima: UIImageView!
    
    // Diccionario que contiene los códigos que retorna la API en el campo "icon" del JSON y su respectivo icono
    // Para ver el listado de códigos y su significado ir a http://openweathermap.org/weather-conditions
    var iconos: [String: String] = ["01d": "fair.png", "01n": "sunny_night.png", "02d": "cloudy1.png", "02n": "cloudy1_night", "03d": "cloudy4.png", "03n": "cloudy4.png", "04d": "cloudy4.png", "04n": "cloudy4.png", "09d": "shower1_night.png", "09n": "shower1_night.png", "10d": "shower1_night.png", "10n": "shower1_night.png", "11d": "tstorm2_night.png", "11n": "tstorm2_night.png", "13d": "snow1_night.png", "13n": "snow1_night", "50d": "fog.png", "50n": "fog_night.png"]
    
    var clima: String?
    var icono: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "clima.jpeg")!)
    }

    @IBAction func iniciarWebServiceCall(sender: UIButton) {
        
        //println("Mi ciudad \(capturaTexto.text)");
        
        if(!self.capturaTexto.text.isEmpty) {
            llamadaWebService()
        } else {
            self.labelClima.text = "Debe ingresar una ciudad"
            self.imagenClima.image = nil
        }
        
    }

    func llamadaWebService() {
        let urlPath = "http://api.openweathermap.org/data/2.5/weather?q=\(capturaTexto.text),es&lang=sp"
        
        let url = NSURL(string: urlPath)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            
            if(error != nil) {
                println(error.localizedDescription)
            }
            
            var nsdata: NSData = NSData(data: data)

            self.recuperarClimaDeJson(nsdata)
            
            dispatch_async(dispatch_get_main_queue(), {
                if(self.clima != nil) {
                    println(self.clima!)
                    self.labelClima.text = self.clima!
                    
                    self.imagenClima.image = UIImage(named: self.icono!)
                } else {
                    println(self.clima)
                    self.labelClima.text = "No se puede recuperar el clima"
                    self.imagenClima.image = nil
                }

            })
        })
        
        task.resume()
    }
    
    func recuperarClimaDeJson(nsdata: NSData) {
        self.clima = nil
        
        let jsonCompleto: AnyObject! = NSJSONSerialization.JSONObjectWithData(nsdata, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        println(jsonCompleto)
        
        let arregloJsonWeather = jsonCompleto["weather"]
        
        if let jsonArray = arregloJsonWeather as? NSArray {
            
            jsonArray.enumerateObjectsUsingBlock({model, index, stop in
                self.clima = model["description"] as? String
                
                var codigo = model["icon"] as? String
                self.icono = self.iconos[codigo!]
            })
        }
    }
}

