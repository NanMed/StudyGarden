//
//  PonderacionRegistro.swift
//  StudyGarden
//
//  Created by Nancy Medina on 27/05/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PonderacionRegistro: UIViewController {

    var materia:String = ""
    var regMateria:String = "Materia"
    
    @IBOutlet weak var materiaLabel: UILabel!
    
    @IBOutlet weak var eval1: UITextField!
    @IBOutlet weak var eval11: UITextField!
    @IBOutlet weak var pond11: UITextField!
    @IBOutlet weak var pond1: UITextField!
    @IBOutlet weak var eval12: UITextField!
    @IBOutlet weak var pond12: UITextField!
    @IBOutlet weak var eval13: UITextField!
    @IBOutlet weak var pond13: UITextField!
    
    
    @IBOutlet weak var eval2: UITextField!
    @IBOutlet weak var pond2: UITextField!
    @IBOutlet weak var eval21: UITextField!
    @IBOutlet weak var pond21: UITextField!
    @IBOutlet weak var eval22: UITextField!
    @IBOutlet weak var pond22: UITextField!
    @IBOutlet weak var eval23: UITextField!
    @IBOutlet weak var pond23: UITextField!
    
    
    @IBOutlet weak var eval3: UITextField!
    @IBOutlet weak var pond3: UITextField!
    @IBOutlet weak var eval4: UITextField!
    @IBOutlet weak var pond4: UITextField!
    @IBOutlet weak var eval5: UITextField!
    @IBOutlet weak var pond5: UITextField!
    
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        materiaLabel.text = materia
        // Do any additional setup after loading the view.
    }

    @IBAction func registrarDatos(_ sender: UIButton) {
        //Para la identificación del path se utilizará el User Id del usuario actual
        let userid = Auth.auth().currentUser?.uid
         //Obtener el texto introducido por el usuario
         //Hace falta verificar que el texto no sea nulo
        let materiaRegistro:String = self.materiaLabel.text!
        print(materiaRegistro)
        if(materiaRegistro.elementsEqual("AMMS")){
            regMateria = "Materia1"
        } else if (materiaRegistro.elementsEqual("Bases de Datos")){
            regMateria = "Materia2"
        } else if (materiaRegistro.elementsEqual("Dispositivos Móviles")){
            regMateria = "Materia3"
        } else if (materiaRegistro.elementsEqual("Programación Avanzada")){
            regMateria = "Materia4"
        }
        
        let e1:String = self.eval1.text!
        let p1:String = self.pond1.text!
        let e11:String = self.eval11.text!
        let p11:String = self.pond11.text!
        let e12:String = self.eval12.text!
        let p12:String = self.pond12.text!
        let e13:String = self.eval13.text!
        let p13:String = self.pond13.text!
        
        let e2:String = self.eval2.text!
        let p2:String = self.pond2.text!
        let e21:String = self.eval21.text!
        let p21:String = self.pond21.text!
        let e22:String = self.eval22.text!
        let p22:String = self.pond22.text!
        let e23:String = self.eval23.text!
        let p23:String = self.pond23.text!
        
        let e3:String = self.eval3.text!
        let p3:String = self.pond3.text!
        let e4:String = self.eval4.text!
        let p4:String = self.pond4.text!
        let e5:String = self.eval5.text!
        let p5:String = self.pond5.text!
        //Relizar la actualización en la BD
        ref.child("Usuarios/"+userid!).child(regMateria).updateChildValues(["Materia":materiaRegistro, "Evaluacion1":e1, "Ponderacion1":p1, "Evaluacion2":e2, "Ponderacion2":p2, "Evaluacion3":e3, "Ponderacion3":p3, "Evaluacion4":e4, "Ponderacion4":p4, "Evaluacion5":e5, "Ponderacion5":p5, "Calificacion3": "0", "Calificacion4": "0", "Calificacion5": "0", "TotalFinal": "0"])
        
        ref.child("Usuarios/"+userid!).child(regMateria).child("Evaluacion1").updateChildValues(["Eval1":e11, "Ponde1":p11, "Eval2":e12, "Ponde2":p12, "Eval3":e13, "Ponde3":p13, "PromEval1": "0", "PromEval2": "0", "PromEval3": "0", "TotalEval": "0"])
        
        ref.child("Usuarios/"+userid!).child(regMateria).child("Evaluacion2").updateChildValues(["Eval1":e21, "Ponde1":p21, "Eval2":e22, "Ponde2":p22, "Eval3":e23, "Ponde3":p23, "PromEval1": "0", "PromEval2": "0", "PromEval3": "0", "TotalEval": "0"])
         //Notificar al usuario que la actualización fue exitosa
        let alert = UIAlertController(title: "Datos guardados", message: "Los datos se almacenaron exitosamente", preferredStyle: .alert)
         
        alert.addAction(UIAlertAction(title: "Continuar", style: .default, handler: nil))
         
        self.present(alert, animated: true)
    }
    
    
    @IBAction func pantallaVer(_ sender: Any) {
        let siguienteVista = self.storyboard?.instantiateViewController(withIdentifier: "Ver") as! ResultadoRegistroMateria
        siguienteVista.materiaReg = materia
        siguienteVista.eval1 = eval1.text!
        siguienteVista.eval2 = eval2.text!
        self.navigationController?.pushViewController(siguienteVista, animated: true)
    }
    
}
