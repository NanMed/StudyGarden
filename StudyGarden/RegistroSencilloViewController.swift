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
        ref.child("Usuarios/"+userid!).child(regMateria).updateChildValues([caliEval: calEval])
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
