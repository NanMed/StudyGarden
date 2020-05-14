//
//  MateriaRegistradaViewController.swift
//  StudyGarden
//
//  Created by user168001 on 5/13/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit

class MateriaRegistradaViewController: UIViewController {

    var materia:String="AMSS"
    
    @IBOutlet weak var LaMateria: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LaMateria.text = materia
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
