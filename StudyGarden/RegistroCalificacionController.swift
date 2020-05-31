//
//  RegistroCalificacionController.swift
//  StudyGarden
//
//  Created by Nancy Medina on 29/05/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class RegistroCalificacionController: UIViewController {

    //Varibales que recibo del otro view controller
    var eval1:String = ""
    var materiaReg:String = ""
    var numEval:String = ""
    var numMateria:String = ""
    var varEval11:String = ""
    var varEval12:String = ""
    var varEval13:String = ""
    
    //Variables para sacar los puntos obtenidos por la evcaluacion
    var ponder1:Float = -1.0
    var ponder2:Float = -1.0
    var ponder3:Float = -1.0
    var prom1:Float = -1.0
    var prom2:Float = -1.0
    var prom3:Float = -1.0
    
    //Variables del diseño
    @IBOutlet weak var labelEval1: UILabel!
    @IBOutlet weak var evalHijo: UITextField!
    @IBOutlet weak var calificacion1: UITextField!
    @IBOutlet weak var calificacion2: UITextField!
    @IBOutlet weak var calificacion3: UITextField!
    @IBOutlet weak var promedio: UILabel!
    
    @IBOutlet weak var promedio1: UILabel!
    @IBOutlet weak var promedio2: UILabel!
    @IBOutlet weak var promedio3: UILabel!
    @IBOutlet weak var ponderacion1: UILabel!
    @IBOutlet weak var ponderacion2: UILabel!
    @IBOutlet weak var ponderacion3: UILabel!
    
    @IBOutlet weak var puntos1: UILabel!
    @IBOutlet weak var puntos2: UILabel!
    @IBOutlet weak var puntos3: UILabel!
    @IBOutlet weak var totalPuntos: UILabel!
    
    
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelEval1.text = eval1
    }
    
    @IBAction func registrarCalis(_ sender: Any) {
        let c1 = Float(calificacion1.text!)
        let c2 = Float(calificacion2.text!)
        let c3 = Float(calificacion3.text!)
        let prom:Float = (c1! + c2! + c3!)/(3)
        promedio.text = String(prom)
        let promedio:String = self.promedio.text!
        
        let userid = Auth.auth().currentUser?.uid
        
        if(materiaReg.elementsEqual("AMMS")){
            numMateria = "Materia1"
        } else if (materiaReg.elementsEqual("Bases de Datos")){
            numMateria = "Materia2"
        } else if (materiaReg.elementsEqual("Dispositivos Móviles")){
            numMateria = "Materia3"
        } else if (materiaReg.elementsEqual("Programación Avanzada")){
            numMateria = "Materia4"
        }
        
        if(varEval11.elementsEqual(evalHijo.text!)){
            ref.child("Usuarios/"+userid!).child(numMateria).child(numEval).updateChildValues(["PromEval1": promedio])
        } else if(varEval12.elementsEqual(evalHijo.text!)){
            ref.child("Usuarios/"+userid!).child(numMateria).child(numEval).updateChildValues(["PromEval2": promedio])
        } else if(varEval13.elementsEqual(evalHijo.text!)){
            ref.child("Usuarios/"+userid!).child(numMateria).child(numEval).updateChildValues(["PromEval3": promedio])
        }
        
    }
    
    @IBAction func cargarInfo(_ sender: Any) {
        let userid = Auth.auth().currentUser?.uid
        if(materiaReg.elementsEqual("AMMS")){
            numMateria = "Materia1"
        } else if (materiaReg.elementsEqual("Bases de Datos")){
            numMateria = "Materia2"
        } else if (materiaReg.elementsEqual("Dispositivos Móviles")){
            numMateria = "Materia3"
        } else if (materiaReg.elementsEqual("Programación Avanzada")){
            numMateria = "Materia4"
        }
        
        ref.child("Usuarios").child(userid!).child(numMateria).child(numEval).observeSingleEvent(of: .value, with: {
        (snapshot) in
           let datos = snapshot.value as? [String:Any]
            self.promedio1.text = datos?["PromEval1"] as? String
            self.promedio2.text = datos?["PromEval2"] as? String
            self.promedio3.text = datos?["PromEval3"] as? String
            
            self.ponderacion1.text = datos?["Ponde1"] as? String
            self.ponderacion2.text = datos?["Ponde2"] as? String
            self.ponderacion3.text = datos?["Ponde3"] as? String
            
            self.ponder1 = Float(self.ponderacion1.text!)!
            self.ponder2 = Float(self.ponderacion2.text!)!
            self.ponder3 = Float(self.ponderacion3.text!)!
            self.prom1 = Float(self.promedio1.text!) ?? 0.0
            self.prom2 = Float(self.promedio2.text!) ?? 0.0
            self.prom3 = Float(self.promedio3.text!) ?? 0.0
        })
    }
    
    
    @IBAction func verResultados(_ sender: Any) {
        let ac1 = Float(prom1 * (ponder1/100))
        let ac2 = Float(prom2 * (ponder2/100))
        let ac3 = Float(prom3 * (ponder3/100))
        puntos1.text = String(ac1)
        puntos2.text = String(ac2)
        puntos3.text = String(ac3)
        let suma = Float(ac1 + ac2 + ac3)
        totalPuntos.text = String(suma)
    }
    
    @IBAction func registarTotalEval(_ sender: Any) {
        let userid = Auth.auth().currentUser?.uid
        if(materiaReg.elementsEqual("AMMS")){
            numMateria = "Materia1"
        } else if (materiaReg.elementsEqual("Bases de Datos")){
            numMateria = "Materia2"
        } else if (materiaReg.elementsEqual("Dispositivos Móviles")){
            numMateria = "Materia3"
        } else if (materiaReg.elementsEqual("Programación Avanzada")){
            numMateria = "Materia4"
        }
         let totalEval1:String = self.totalPuntos.text!
        ref.child("Usuarios/"+userid!).child(numMateria).child(numEval).updateChildValues(["TotalEval": totalEval1])
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
