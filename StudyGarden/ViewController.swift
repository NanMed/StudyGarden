//
//  ViewController.swift
//  StudyGarden
//
//  Created by Nancy Medina on 20/04/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var fotoVista: UIImageView!
    private let miPicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //if !UIImagePickerController.isSourceTypeAvailable(.camera){
            //buttonCamara.isHidden = true
        //}
        miPicker.delegate = self
    }

    //@IBAction func camara() {
        //miPicker.sourceType = UIImagePickerController.SourceType.camera
        //present(miPicker, animated: true, completion: nil)
    //}
    
    //@IBAction func guardarImg() {
        //UIImageWriteToSavedPhotosAlbum(fotoVista.image!, nil, nil, nil)
    //}
    
    
    @IBAction func album(_ sender: Any) {
        print("Dentro")
        miPicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        present(miPicker, animated: true, completion: nil)
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("Dentro de nuevo")
        fotoVista.image = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

