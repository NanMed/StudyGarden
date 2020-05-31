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
        })
        eval1Label.text = eval1
        eval2Label.text = eval2
        
    }
    
    
    @IBAction func agregarEval1(_ sender: Any) {
        let siguienteVista = self.storyboard?.instantiateViewController(withIdentifier: "RegistroCalificacion") as! RegistroCalificacionController
        siguienteVista.eval1 = eval1
        siguienteVista.materiaReg = materiaReg
        siguienteVista.numEval = "Evaluacion1"
        siguienteVista.varEval11 = eval11.text!
        siguienteVista.varEval12 = eval12.text!
        siguienteVista.varEval13 = eval13.text!
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
