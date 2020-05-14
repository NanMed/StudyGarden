//
//  mapViewController.swift
//  StudyGarden
//
//  Created by Jimena Bermudez Bautista on 13/05/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class mapViewController: UIViewController, MKMapViewDelegate {
    let treeAnnotations = TreeAnnotations()
    let initialCoordinate = CLLocationCoordinate2DMake(19.3573267,-99.2699144)
  
    @IBOutlet weak var mapView: MKMapView!
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = MKMarkerAnnotationView()
        guard let annotation = annotation as? TreeAnnotation else {return nil}
        var identifier = ""
        var color = UIColor.red
        switch annotation.type{
        case .progra:
            identifier = "Programación Avanzada"
            color = .green
        case .calidad:
            identifier = "Calidad y Pruebas"
            color = .green
        case .amss:
            identifier = "AMSS"
            color = .green
        }
        if let dequedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            annotationView = dequedView
        } else{
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        annotationView.markerTintColor = color
        annotationView.glyphImage = UIImage(named: "tree")

        return annotationView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.delegate = self
        //set intial region
        let initialregion = MKCoordinateRegion(center: initialCoordinate, span: MKCoordinateSpanMake(0.001, 0.001))
        mapView.setRegion(initialregion, animated: true)
        // add the annotations
        mapView.addAnnotations(treeAnnotations.restaurants)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

