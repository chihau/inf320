//
//  ViewController.swift
//  HelloCities
//
//  Created by Chihau Chau on 10-06-15.
//  Copyright (c) 2015 Chihau Chau. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let ciudades = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
        "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
        "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
        "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
        "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
    
    let coordenadas:[(lat: Double, lon: Double)] = [(40.7033127, -73.979681), (34.0204989, -118.4117325), (41.8337329, -87.7321555), (29.817178,-95.4012915), (40.0047528,-75.1180329), (33.6054149,-112.125051), (32.8245525,-117.0951632), (29.4814305,-98.5144044), (32.8206645,-96.7313396), (42.352711,-83.099205), (37.2970155,-121.8174109), (39.7797845,-86.13275), (30.34499,-81.720457), (37.7577,-122.4376), (39.9829515,-82.990829), (30.3077609,-97.7534014), (35.129186,-89.970787), (39.2847064,-76.6204859), (35.2031535,-80.8395259), (32.800813,-97.2893189)]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cl.chihau.DemoPrototypeCell", forIndexPath: indexPath) as! DemoPrototypeCell
        let cityState = ciudades[indexPath.row].componentsSeparatedByString(", ")
        cell.cityLabel.text = cityState.first
        cell.stateLabel.text = cityState.last
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ciudades.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "MostrarDetalleSegue" {
            if let destination = segue.destinationViewController as? DetalleViewController {
                if let dataIndex = tableView.indexPathForSelectedRow()?.row {
                    destination.title = ciudades[dataIndex]
                    
                    destination.lat = coordenadas[dataIndex].lat
                    destination.lon = coordenadas[dataIndex].lon
                }
                
            }
        }
    }


}

