//
//  mapViewController.swift
//  StudyGarden
//
//  Created by Jimena Bermudez Bautista on 13/05/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import MapKit
import CoreLocation
import UIKit

class mapViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var mapa: MKMapView!
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
        mapa.mapType=MKMapType.hybrid
        let cl=CLLocationCoordinate2DMake(19.3574332,-99.2705678)
        //mapa.region=MKCoordinateRegion(center: cl, latitudinalMeters: 2000, longitudinalMeters: 2000)
        let delta=CLLocationDegrees(0.01)
        let span=MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        mapa.region=MKCoordinateRegion(center: cl, span: span)
        let rest = MKPointAnnotation()
        rest.coordinate = cl
        rest.title = "Árbol"
        rest.subtitle = "Programación Avanzada"
        mapa.addAnnotation(rest)
        mapa.showsCompass=true
        mapa.showsScale=true
        mapa.showsTraffic=true
        mapa.isZoomEnabled=true
        
        
    }

    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationManager.startUpdatingLocation()
            mapa.showsUserLocation = true
        } else {
            locationManager.stopUpdatingLocation()
            mapa.showsUserLocation = false
        }
    }

}
