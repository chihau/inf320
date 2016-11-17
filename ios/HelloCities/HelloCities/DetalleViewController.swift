//
//  DetalleViewController.swift
//  HelloCities
//
//  Created by Chihau Chau on 17-11-16.
//  Copyright © 2016 Chihau Chau. All rights reserved.
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //location es el centro
    func centerMapOnLocation(location: CLLocation) {
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, radioRegion * 15.0, radioRegion * 15.0)
        myMapView.setRegion(region, animated: true)
    }

}
