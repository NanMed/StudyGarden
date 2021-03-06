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

    var materiaReg:String = ""
    var eval1: String = ""
    var eval2:String = ""
    var numMateria:String = ""
    @IBOutlet weak var materiaLabel: UILabel!
    
    
    @IBOutlet weak var eval1Label: UILabel!
    @IBOutlet weak var pond1: UILabel!
    @IBOutlet weak var eval11: UILabel!
    @IBOutlet weak var pond11: UILabel!
    @IBOutlet weak var eval12: UILabel!
    @IBOutlet weak var pond12: UILabel!
    @IBOutlet weak var eval13: UILabel!
    @IBOutlet weak var pond13: UILabel!
    
    @IBOutlet weak var eval2Label: UILabel!
    @IBOutlet weak var pond2: UILabel!
    @IBOutlet weak var eval21: UILabel!
    @IBOutlet weak var pond21: UILabel!
    @IBOutlet weak var eval22: UILabel!
    @IBOutlet weak var pond22: UILabel!
    @IBOutlet weak var eval23: UILabel!
    @IBOutlet weak var pond23: UILabel!
    
    @IBOutlet weak var eval3: UILabel!
    @IBOutlet weak var pond3: UILabel!
    @IBOutlet weak var eval4: UILabel!
    @IBOutlet weak var pond4: UILabel!
    @IBOutlet weak var eval5: UILabel!
    @IBOutlet weak var pond5: UILabel!
    
    @IBOutlet weak var promedioFinal: UILabel!
    
    @IBOutlet weak var c1Label: UILabel!
    @IBOutlet weak var c2Label: UILabel!
    @IBOutlet weak var c3Label: UILabel!
    @IBOutlet weak var c4Label: UILabel!
    @IBOutlet weak var c5Label: UILabel!
    
    var ponder1:Float = -1.0
    var ponder2:Float = -1.0
    var ponder3:Float = -1.0
    var ponder4:Float = -1.0
    var ponder5:Float = -1.0
    
    var totalEval1:Float = -1.0
    var totalEval2:Float = -1.0
    var totalEval3:Float = -1.0
    var totalEval4:Float = -1.0
    var totalEval5:Float = -1.0
    
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*lectura*/
        if(materiaReg.elementsEqual("AMMS")){
            numMateria = "Materia1"
        } else if (materiaReg.elementsEqual("Bases de Datos")){
            numMateria = "Materia2"
        } else if (materiaReg.elementsEqual("Dispositivos Móviles")){
            numMateria = "Materia3"
        } else if (materiaReg.elementsEqual("Programación Avanzada")){
            numMateria = "Materia4"
        }
        //Para la identificación del path se utilizará el User Id del usuario actual
         let userid = Auth.auth().currentUser?.uid
        // El método .observeSingleEvent realiza una consulta puntual de los valores de los atributos hijos del path
        ref.child("Usuarios").child(userid!).child(numMateria).observeSingleEvent(of: .value, with: {
         (snapshot) in
            let datos = snapshot.value as? [String:Any]
            self.materiaLabel.text = datos?["Materia"] as? String
            self.pond1.text = datos?["Ponderacion1"] as? String
            self.pond2.text = datos?["Ponderacion2"] as? String
            self.eval3.text = datos?["Evaluacion3"] as? String
            self.pond3.text = datos?["Ponderacion3"] as? String
            self.eval4.text = datos?["Evaluacion4"] as? String
            self.pond4.text = datos?["Ponderacion4"] as? String
            self.eval5.text = datos?["Evaluacion5"] as? String
            self.pond5.text = datos?["Ponderacion5"] as? String
            self.promedioFinal.text = datos?["TotalFinal"] as? String
            self.c3Label.text = datos?["Calificacion3"] as? String
            self.c4Label.text = datos?["Calificacion4"] as? String
            self.c5Label.text = datos?["Calificacion5"] as? String
            
            self.ponder1 = Float(self.pond1.text!)!
            self.ponder2 = Float(self.pond2.text!)!
            self.ponder3 = Float(self.pond3.text!)!
            self.ponder4 = Float(self.pond4.text!)!
            self.ponder5 = Float(self.pond5.text!)!
            self.totalEval3 = Float(self.c3Label.text!)!
            self.totalEval4 = Float(self.c4Label.text!)!
            self.totalEval5 = Float(self.c5Label.text!)!
         })
        ref.child("Usuarios").child(userid!).child(numMateria).child("Evaluacion1").observeSingleEvent(of: .value, with: {
        (snapshot) in
            let datos2 = snapshot.value as? [String:Any]
            self.eval11.text = datos2?["Eval1"] as? String
            self.pond11.text = datos2?["Ponde1"] as? String
            self.eval12.text = datos2?["Eval2"] as? String
            self.pond12.text = datos2?["Ponde2"] as? String
            self.eval13.text = datos2?["Eval3"] as? String
            self.pond13.text = datos2?["Ponde3"] as? String
            self.c1Label.text = datos2?["TotalEval"] as? String
            
            self.totalEval1 = Float(self.c1Label.text!)!
        })
        
        ref.child("Usuarios").child(userid!).child(numMateria).child("Evaluacion2").observeSingleEvent(of: .value, with: {
        (snapshot) in
            let datos3 = snapshot.value as? [String:Any]
            self.eval21.text = datos3?["Eval1"] as? String
            self.pond21.text = datos3?["Ponde1"] as? String
            self.eval22.text = datos3?["Eval2"] as? String
            self.pond22.text = datos3?["Ponde2"] as? String
            self.eval23.text = datos3?["Eval3"] as? String
            self.pond23.text = datos3?["Ponde3"] as? String
            self.c2Label.text = datos3?["TotalEval"] as? String
            
            self.totalEval2 = Float(self.c2Label.text!)!
        })
        eval1Label.text = eval1
        eval2Label.text = eval2
        
    }
    
    
    @IBAction func agregarEval1(_ sender: Any) {
        let siguienteVista = self.storyboard?.instantiateViewController(withIdentifier: "RegistroCalificacion") as! RegistroCalificacionController
        siguienteVista.evalReg = eval1
        siguienteVista.eval1 = eval1
        siguienteVista.eval2 = eval2
        siguienteVista.materiaReg = materiaReg
        siguienteVista.numEval = "Evaluacion1"
        siguienteVista.varEval11 = eval11.text!
        siguienteVista.varEval12 = eval12.text!
        siguienteVista.varEval13 = eval13.text!
        self.navigationController?.pushViewController(siguienteVista, animated: true)
    }
    
    
    @IBAction func agregarEval2(_ sender: Any) {
        let siguienteVista = self.storyboard?.instantiateViewController(withIdentifier: "RegistroCalificacion") as! RegistroCalificacionController
        siguienteVista.evalReg = eval2
        siguienteVista.eval1 = eval1
        siguienteVista.eval2 = eval2
        siguienteVista.materiaReg = materiaReg
        siguienteVista.numEval = "Evaluacion2"
        siguienteVista.varEval11 = eval21.text!
        siguienteVista.varEval12 = eval22.text!
        siguienteVista.varEval13 = eval23.text!
        self.navigationController?.pushViewController(siguienteVista, animated: true)
    }
    
    
    @IBAction func agregarEval3(_ sender: Any) {
         let siguienteVista = self.storyboard?.instantiateViewController(withIdentifier: "RegSencillo") as! RegistroSencilloViewController
         siguienteVista.varEval = eval3.text!
        siguienteVista.caliEval = "Calificacion3"
        siguienteVista.regMateria = materiaReg
        siguienteVista.eval1 = eval1
        siguienteVista.eval2 = eval2
        self.navigationController?.pushViewController(siguienteVista, animated: true)
        
        
    }
    
    @IBAction func agregarEval4(_ sender: Any) {
         let siguienteVista = self.storyboard?.instantiateViewController(withIdentifier: "RegSencillo") as! RegistroSencilloViewController
         siguienteVista.varEval = eval4.text!
        siguienteVista.caliEval = "Calificacion4"
        siguienteVista.regMateria = materiaReg
        siguienteVista.eval1 = eval1
        siguienteVista.eval2 = eval2
        self.navigationController?.pushViewController(siguienteVista, animated: true)
    }
    
    
    @IBAction func agregarEval5(_ sender: Any) {
         let siguienteVista = self.storyboard?.instantiateViewController(withIdentifier: "RegSencillo") as! RegistroSencilloViewController
         siguienteVista.varEval = eval5.text!
        siguienteVista.caliEval = "Calificacion5"
        siguienteVista.regMateria = materiaReg
        siguienteVista.eval1 = eval1
        siguienteVista.eval2 = eval2
        self.navigationController?.pushViewController(siguienteVista, animated: true)
    }
    
    @IBAction func calcularPromedio(_ sender: Any) {
        let ac1 = Float(totalEval1*(ponder1/100))
        let ac2 = Float(totalEval2 * (ponder2/100) )
        let ac3 = Float(totalEval3 * (ponder3/100))
        let ac4 = Float(totalEval4 * (ponder4/100))
        let ac5 = Float(totalEval5 * (ponder5/100))
        let suma = Float(ac1 + ac2 + ac3 + ac4 + ac5)
        promedioFinal.text = String(suma)
        let final:String = self.promedioFinal.text!
        
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
        
        ref.child("Usuarios/"+userid!).child(numMateria).updateChildValues(["TotalFinal": final])
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
