//
//  DetalleViewController.swift
//  HelloCities
//
//  Created by Chihau Chau on 10-06-15.
//  Copyright (c) 2015 Chihau Chau. All rights reserved.
//

import UIKit
import MapKit

class DetalleViewController: UIViewController {
    
    @IBOutlet weak var myMapView: MKMapView!
    
    var lat = Double()
    var lon = Double()
    
    override func viewWillAppear(animated: Bool) {
        let punto = CLLocation(latitude: lat, longitude: lon)
        
        centerMapOnLocation(punto)
    }
    
    let radioRegion: CLLocationDistance = 1000 //metros
    
    //location es el centro
    func centerMapOnLocation(location: CLLocation) {
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate,
            radioRegion * 15.0, radioRegion * 15.0)
        myMapView.setRegion(region, animated: true)
    }

}
