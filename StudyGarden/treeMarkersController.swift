//
//  treeMarkersController.swift
//  StudyGarden
//
//  Created by Jimena Bermudez Bautista on 13/05/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit
import MapKit

enum TreeType {
    case progra
    case calidad
    case amss
}

class TreeAnnotation:NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var type: TreeType
    init(_ latitude:CLLocationDegrees,_ longitude:CLLocationDegrees,title:String,subtitle:String,type:TreeType){
        self.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        self.title = title
        self.subtitle = subtitle
        self.type = type
    }
}


class TreeAnnotations: NSObject {
    var restaurants:[TreeAnnotation]
    
    override init(){
       //build an array of pizza loactions literally
        restaurants = [TreeAnnotation(19.3573267,-99.2699144, title: "Árbol Uno", subtitle:"Programación Avanzada", type: .progra)]
        restaurants += [TreeAnnotation(19.3571990,-99.2698775, title: "Árbol Dos", subtitle:"Calidad y Pruebas", type: .calidad)]
        restaurants += [TreeAnnotation(19.3571528,-99.2697883, title: "Árbol tres", subtitle:"AMSS", type: .amss)]
       
        
    }
}

