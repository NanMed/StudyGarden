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
    
    @IBAction func logIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: correoText.text!, password: passText.text!){
            (user, error) in
            if error != nil{
                print(error!)
                let alert = UIAlertController(title: "Error", message: error.debugDescription, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Continuar", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            }else{
                print("Login exitoso")
                self.performSegue(withIdentifier: "goLogIn", sender: self)
               
            }
            
        }
    }
    
    @IBAction func crearCuenta(_ sender: Any) {
        Auth.auth().createUser(withEmail: correoText.text!, password: passText.text!){(user, error) in
            if error != nil{
                //Que se quede en la misma pantalla
                print(error!)
                let alert = UIAlertController(title: "Error", message: error.debugDescription, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Continuar", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            }
            else{
                print("Registro de usuario exitoso")
                self.performSegue(withIdentifier: "goLogIn", sender: self)
            }
            
        }
    }
    

}
