//
//  ResgistrarUsuario.swift
//  StudyGarden
//
//  Created by Nancy Medina on 20/05/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit
import Firebase

class ResgistrarUsuario: UIViewController {

    @IBOutlet weak var correoText: UITextField!
    @IBOutlet weak var passText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func crearCuenta(_ sender: Any) {
        Auth.auth().createUser(withEmail: correoText.text!, password: passText.text!){(user, error) in
            
            if error != nil{
                print(error!)
            }
            else{
                print("Registro de usuario exitoso")
                self.performSegue(withIdentifier: "goInicio", sender: self)
            }
            
        }
    }
    

}
