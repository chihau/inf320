//
//  ViewController.swift
//  HelloMapKit
//
//  Created by Chihau Chau on 17-11-16.
//  Copyright © 2016 Chihau Chau. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    // Creamos la variable que contendrá la latitud y la longitud de la posición en el mapa
    let puntoCentral = CLLocation(latitude: -33.035594, longitude: -71.595273)
    
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
        // Do any additional setup after loading the view, typically from a nib.
        
        // Tipo de mapa (standard, satellite, hybrid)
        mapView.mapType = MKMapType.hybrid

        centerMapOnLocation(location: puntoCentral)
        
        // creamos un marcador
        let annotation = Annotation(title: "Piscina UTFSM", subtitle: "Aquí se tira a los titulados", coordinate: CLLocationCoordinate2D(latitude: -33.035565, longitude: -71.595481))
        
        // mostramos el marcador
        mapView.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

