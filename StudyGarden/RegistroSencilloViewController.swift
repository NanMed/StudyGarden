//
//  RegistroSencilloViewController.swift
//  StudyGarden
//
//  Created by user168001 on 6/1/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit

class RegistroSencilloViewController: UIViewController {
    
    var varEval:String = ""
    var caliEval:String = ""

    @IBOutlet weak var evaluacion: UILabel!
    
    @IBOutlet weak var calif: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        evaluacion.text = varEval
        // Do any additional setup after loading the view.
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
