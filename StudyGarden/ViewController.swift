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

    private let miPicker = UIImagePickerController()
    
    
    @IBOutlet weak var viewFoto: UIImageView!
    @IBOutlet weak var botonCamara: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //if !UIImagePickerController.isSourceTypeAvailable(.camera){
            //botonCamara.isHidden = true
        //}
        miPicker.delegate = self
    }
    
    @IBAction func guardarImg(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum(viewFoto.image!, nil, nil, nil)
    }
    
    //@IBAction func camara(_ sender: Any) {
        //miPicker.sourceType = UIImagePickerController.SourceType.camera
        //present(miPicker, animated: true, completion: nil)
    //}
    
    @IBAction func album(_ sender: Any) {
        print("Dentro")
        miPicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        present(miPicker, animated: true, completion: nil)
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        viewFoto.image = (info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage)!
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

