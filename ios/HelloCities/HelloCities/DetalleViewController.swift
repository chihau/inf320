//
//  DetalleViewController.swift
//  HelloCities
//
//  Created by Chihau Chau on 06-12-18.
//  Copyright © 2018 Chihau Chau. All rights reserved.
//

import UIKit
import MapKit

class DetalleViewController: UIViewController {
    @IBOutlet weak var myMapView: MKMapView!
    
    var lat = Double()
    var lon = Double()
    
    let radioRegion: CLLocationDistance = 1000 //metros

    override func viewWillAppear(_ animated: Bool) {
        let punto = CLLocation(latitude: lat, longitude: lon)
        
        centerMapOnLocation(location: punto)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //location es el centro
    func centerMapOnLocation(location: CLLocation) {
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: radioRegion * 15.0, longitudinalMeters: radioRegion * 15.0)
        myMapView.setRegion(region, animated: true)
    }

}
