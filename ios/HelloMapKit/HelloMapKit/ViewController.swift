//
//  ViewController.swift
//  HelloMapKit
//
//  Created by Chihau Chau on 08-06-15.
//  Copyright (c) 2015 Chihau Chau. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    // Creamos la variable que contendrá la latitud y la longitud de la posición en el mapa
    let puntoCentral = CLLocation(latitude: -33.034853, longitude: -71.594337)
    
    // Esto es para definir el radio que queremos mostrar del mapa (en metros)
    let radioRegion: CLLocationDistance = 500 // medio Kilómetro
    
    func centerMapOnLocation(location: CLLocation) {
        // Definimos la región que queremos mostrar
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, radioRegion * 2.0, radioRegion * 2.0)
        
        // Le decimos al mapView que muestre la región
        mapView.setRegion(region, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        centerMapOnLocation(puntoCentral)
        
        // show artwork on map
        let annotation = Annotation(title: "Piscina UTFSM",
            subtitle: "Aquí se tira a los títulados",
            coordinate: CLLocationCoordinate2D(latitude: -33.035565, longitude: -71.595481))
        
        mapView.addAnnotation(annotation)
    }
    
    // Método definido en el protocolo MKMapViewDelegate
    // Método que es llamado cada vez que se quiere agregar un marcador
    // Retorna la View del marcador que queremos pintar en el mapa
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if let annotation = annotation as? Annotation {
            let identifier = "pin"
            var view: MKPinAnnotationView
            // Esto nos permite reutilizar un marcador que ya no es visitble (similar a lo que hacen los tableView con sus celdas)
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView {
                    dequeuedView.annotation = annotation
                    view = dequeuedView
            // Esto es en el caso de que no se pueda reutilizar el marcador
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                // Para indicar que queremos desplegar info extra
                view.canShowCallout = true
                // Esto es para definir la posición donde aparecerá la burbuja emergente del marcador
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as! UIView
            }
            return view
        }
        return nil
    }

}

