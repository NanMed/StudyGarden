//
//  RegistroSencilloViewController.swift
//  StudyGarden
//
//  Created by user168001 on 6/1/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class RegistroSencilloViewController: UIViewController {
    
    var varEval:String = ""
    var caliEval:String = ""
    var regMateria:String = ""
    var numMateria:String = ""
    var eval1: String = ""
    var eval2:String = ""

    @IBOutlet weak var evaluacion: UILabel!
    
    @IBOutlet weak var calif: UITextField!
    
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        evaluacion.text = varEval
        // Do any additional setup after loading the view.
    }
    

    @IBAction func registrarCalisEval(_ sender: Any) {
        let userid = Auth.auth().currentUser?.uid
        let calEval:String = self.calif.text!
        
        if(regMateria.elementsEqual("AMMS")){
            numMateria = "Materia1"
        } else if (regMateria.elementsEqual("Bases de Datos")){
            numMateria = "Materia2"
        } else if (regMateria.elementsEqual("Dispositivos Móviles")){
            numMateria = "Materia3"
        } else if (regMateria.elementsEqual("Programación Avanzada")){
            numMateria = "Materia4"
        }
        
        if(caliEval.elementsEqual("Calificacion3")){
            ref.child("Usuarios/"+userid!).child(numMateria).updateChildValues(["Calificacion3": calEval])
        } else if(caliEval.elementsEqual("Calificacion4")){
            ref.child("Usuarios/"+userid!).child(numMateria).updateChildValues(["Calificacion4": calEval])
        } else if(caliEval.elementsEqual("Calificacion5")){
            ref.child("Usuarios/"+userid!).child(numMateria).updateChildValues(["Calificacion5": calEval])
        }
        
        //Notificar al usuario que la actualización fue exitosa
        let alert = UIAlertController(title: "Calificación registrada", message: "Los datos se almacenaron exitosamente", preferredStyle: .alert)
                
        alert.addAction(UIAlertAction(title: "Continuar", style: .default, handler: nil))
                
        self.present(alert, animated: true)
        
    }
    
    @IBAction func pantallaVer(_ sender: Any) {
        let siguienteVista = self.storyboard?.instantiateViewController(withIdentifier: "Ver") as! ResultadoRegistroMateria
        siguienteVista.materiaReg = regMateria
        siguienteVista.eval1 = eval1
        siguienteVista.eval2 = eval2
        self.navigationController?.pushViewController(siguienteVista, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
