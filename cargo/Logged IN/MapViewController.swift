//
//  MapViewController.swift
//  cargo
//
//  Created by Huzaifa Ahmed on 7/20/19.
//  Copyright © 2019 Huzaifa Ahmad. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import MapKit
import FirebaseAuth

class MapViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    
    @IBOutlet var mapView: GMSMapView!
    var camera: GMSCameraPosition?

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTheLocationManager()
        camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 14.0)
        mapView!.camera = camera!
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView!.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        
        // Do any additional setup after loading the view.
        //        dequeueReusableCell(withReuseIdentifier: "carCell", for: indexPath)
//        let
      
    }
    
    
    
    func initializeTheLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locationManager.location?.coordinate
        cameraMoveToLocation(toLocation: location)
        let params = [location?.longitude, location?.latitude]
     getAPI(params: params)
        
    }
    
    func cameraMoveToLocation(toLocation: CLLocationCoordinate2D?) {
        if toLocation != nil {
            mapView!.camera = GMSCameraPosition.camera(withTarget: toLocation!, zoom: 15)
        }
    }
    
    func getAPI(params: Array<Any>){        
    
    }
    
    @IBAction func signOut(_ sender: Any) {
        do{
           try? Auth.auth().signOut()
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainController = storyboard.instantiateViewController(withIdentifier: "initialVC")
        self.present(mainController, animated: true, completion: nil)
    }
}

