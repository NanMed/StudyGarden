//
//  ViewController.swift
//  StudyGarden
//
//  Created by Nancy Medina on 20/04/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var fotoVista: UIImageView!
    @IBOutlet weak var buttonCamara: UIButton!
    private let miPicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //if !UIImagePickerController.isSourceTypeAvailable(.camera){
            //buttonCamara.isHidden = true
        //}
        miPicker.delegate = self
    }
    
    @IBAction func camara(_ sender: Any) {
        miPicker.sourceType = UIImagePickerController.SourceType.camera
        present(miPicker, animated: true, completion: nil)
    }
    
    @IBAction func guardarImg(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum(fotoVista.image!, nil, nil, nil)
    }
    
    @IBAction func album(_ sender: Any) {
        miPicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        miPicker.allowsEditing = true
        present(miPicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        fotoVista.image = info[UIImagePickerControllerEditedImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

