//
//  MAPSViewController.swift
//  cargo
//
//  Created by Huzaifa Ahmed on 7/20/19.
//  Copyright © 2019 Huzaifa Ahmad. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class MAPSViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
//    var camera: GMSCameraPosition?
//    var mapView: GMSMapView?
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 14.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        
        self.view = mapView

    }

}

