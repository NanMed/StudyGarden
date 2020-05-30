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

    var eval1:String = ""
    var materiaReg:String = ""
    var numEval:String = ""
    var numMateria:String = ""
    var varEval11:String = ""
    var varEval12:String = ""
    var varEval13:String = ""
    
    var acumulado1:String = ""
    var acumulado2:String = ""
    var acumulado3:String = ""
    
    var ponde1:String = ""
    var ponde2:String = ""
    var ponde3:String = ""
    
    var act1:Int = 0
    var ponder1:Int = 0
    var total:Double = 0.0
    
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
    
    @IBAction func totalEval(_ sender: Any) {
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
        print(numMateria)
        print(numEval)
        ref.child("Usuarios").child(userid!).child(numMateria).child(numEval).observeSingleEvent(of: .value, with: {
        (snapshot) in
           let datos = snapshot.value as? [String:Any]
            //self.promedio1.text = datos?["PromEval1"] as? String
            self.promedio2.text = datos?["PromEval2"] as? String
            self.promedio3.text = datos?["PromEval3"] as? String
            
            self.ponderacion1.text = datos?["Ponde1"] as? String
            self.ponderacion2.text = datos?["Ponde2"] as? String
            self.ponderacion3.text = datos?["Ponde3"] as? String
            
            self.act1 = (self.promedio1.text! as NSString).integerValue
            self.ponder1 = (self.ponderacion1.text! as NSString).integerValue
            self.total = Double(self.act1 + self.ponder1)
            print(self.total)
        })
        
        //let myInt3 = (self.promedio1.text! as NSString).integerValue
        //print(myInt3)
        print("act1 \(act1)")
        print("total \(total)")
        //total = Double(act1 + ponder1)
        //print(total)
        //let ac1 = promedio1.text
        //print(ac1 as Any)
        //let ac2 = Double(promedio2.text!)
        //let ac3 = Double(promedio3.text!)
        //let pon1 = Int(ponderacion1.text!)
        //print(pon1 ?? 0)
        //let pon2 = Double(ponderacion2.text!)
        //let pon3 = Double(ponderacion3.text!)
        //let prueba:Double = Double(ac1! * (pon1!/100))
        //print(prueba)
        //let total:Float = ac1! * (pon1!/100) + ac2! * (pon2!/100) + ac3! * (pon3!/100)
        //ref.child("Usuarios/"+userid!).child(numMateria).child(numEval).updateChildValues(["TotalEval1": prueba])
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
