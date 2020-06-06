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
    @IBOutlet weak var mensajeError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mensajeError.isHidden = true
    }
    
    
    @IBAction func logOut(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            let alert = UIAlertController(title: "Cerrar Sesion", message: "Has salido de la sesion", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func logIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: correoText.text!, password: passText.text!){
            (user, error) in
            if error != nil{
                print(error!)
                self.mensajeError.isHidden = false
                self.mensajeError.text = "Usuario y/o contraseña incorrecto"
                //let alert = UIAlertController(title: "Error", message: error.debugDescription, preferredStyle: .alert)
                
                //alert.addAction(UIAlertAction(title: "Continuar", style: .default, handler: nil))
                
                //self.present(alert, animated: true)
            }else{
                self.mensajeError.isHidden = true
                self.performSegue(withIdentifier: "goLogIn", sender: self)
               
            }
            
        }
    }
    
    @IBAction func crearCuenta(_ sender: Any) {
        Auth.auth().createUser(withEmail: correoText.text!, password: passText.text!){(user, error) in
            if error != nil{
                print(error!)
                self.mensajeError.isHidden = false
                self.mensajeError.text = "El usuario ya existe"
                //let alert = UIAlertController(title: "Error", message: error.debugDescription, preferredStyle: .alert)
                
                //alert.addAction(UIAlertAction(title: "Continuar", style: .default, handler: nil))
                
                //self.present(alert, animated: true)
            }
            else{
                self.mensajeError.isHidden = true
                print("Registro de usuario exitoso")
                self.performSegue(withIdentifier: "goLogIn", sender: self)
            }
            
        }
    }
    

}
