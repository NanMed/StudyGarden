//
//  LogIn.swift
//  StudyGarden
//
//  Created by Nancy Medina on 20/05/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit
import Firebase

class LogIn: UIViewController {

    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func iniciar(_ sender: UIButton) {
        print("Hola")
        Auth.auth().signIn(withEmail: correo.text!, password: password.text!){
            (user, error) in
            if error != nil{
                print(error!)
                let alert = UIAlertController(title: "Error", message: error.debugDescription, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "continue", style: .default, handler: nil))
                
                self.present(alert, animated: true)
            }else{
                print("Login exitoso")
                self.performSegue(withIdentifier: "goLogIn", sender: self)
               
            }
            
        }
    }
}
