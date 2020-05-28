//
//  ResultadoRegistroMateria.swift
//  StudyGarden
//
//  Created by Nancy Medina on 27/05/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ResultadoRegistroMateria: UIViewController {

    @IBOutlet weak var prueba: UILabel!
    @IBOutlet weak var prueba2: UILabel!
    
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*lectura*/
        
        //Para la identificación del path se utilizará el User Id del usuario actual
         let userid = Auth.auth().currentUser?.uid
        // El método .observeSingleEvent realiza una consulta puntual de los valores de los atributos hijos del path
        ref.child("Usuarios").child(userid!).observeSingleEvent(of: .value){
         (snapshot) in
         let datos = snapshot.value as? [String:Any]
            self.prueba.text = datos?["Materia"] as? String
         }
        
        ref.child("Usuarios").child(userid!).child("Materia1").observeSingleEvent(of: .value){
        (snapshot) in
        let datos2 = snapshot.value as? [String:Any]
           self.prueba2.text = datos2?["Materia"] as? String
        }
    }
    

    /*@IBAction func cargarDatos(_ sender: UIButton) {
        /*lectura*/
        
        //Para la identificación del path se utilizará el User Id del usuario actual
         let userid = Auth.auth().currentUser?.uid
        // El método .observeSingleEvent realiza una consulta puntual de los valores de los atributos hijos del path
        ref.child("Usuarios").child(userid!).observeSingleEvent(of: .value){
         (snapshot) in
         let datos = snapshot.value as? [String:Any]
            self.prueba.text = datos?["Materia"] as? String
         }
        
        ref.child("Usuarios").child(userid!).child("Materia").observeSingleEvent(of: .value){
        (snapshot) in
        let datos2 = snapshot.value as? [String:Any]
           self.prueba2.text = datos2?["Evaluacion3"] as? String
        }
        
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
