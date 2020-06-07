//
//  ExploraObjetosViewController.swift
//  StudyGarden
//
//  Created by Nancy Medina on 18/05/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit
import CoreML
import Vision
import Firebase

class ExploraObjetosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var fotoVista: UIImageView!
    @IBOutlet weak var botonCamara: UIButton!
    @IBOutlet weak var resultadoML: UILabel!
    @IBOutlet weak var consejo: UILabel!
    
    private let miPicker = UIImagePickerController()
    
    var dbF:Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbF = Firestore.firestore()
        // Do any additional setup after loading the view.
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            //Desactiva el boton de la camara si no hay camara
            botonCamara.isEnabled = false
            botonCamara.alpha = 0.5
        }
        miPicker.delegate = self
        resultadoML.isHidden = true
        consejo.isHidden = true
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
    
    @IBAction func ejecML(_ sender: Any) {
        resultadoML.isHidden = false
        //instanciar el modelo de la red neuronal
        let modelFile = ProyectoSG()
        let model = try! VNCoreMLModel(for: modelFile.model)
        //Convertir la imagen obtenida a CIImage
        let imagenCI = CIImage(image: fotoVista.image!)
        //Crear un controlador para el manejo de la imagen, este es un requerimiento para ejecutar la solicitud del modelo
        let handler = VNImageRequestHandler(ciImage: imagenCI!)
        //Crear una solicitud al modelo para el análisis de la imagen
        let request = VNCoreMLRequest(model: model, completionHandler: resultadosModelo)
        try! handler.perform([request])
    }
    
    func resultadosModelo(request: VNRequest, error: Error?)
    {
       
        guard let results = request.results as? [VNClassificationObservation] else { fatalError("No hubo respuesta del modelo ML")}
        var bestPrediction = ""
        var bestConfidence: VNConfidence = 0
        //recorrer todas las respuestas en búsqueda del mejor resultado
        for classification in results{
            //print(classification.confidence)
            //print(classification.identifier)
            if (classification.confidence > bestConfidence){
                bestConfidence = classification.confidence
                bestPrediction = classification.identifier
            }
        }
        let resultado = bestPrediction
        resultadoML.text = resultado
    }
    
    @IBAction func consejo(_ sender: Any) {
        consejo.isHidden = false
        let ref = dbF.collection("objetos").document(resultadoML.text!)
        ref.getDocument { (snapshot, err) in
            if let data = snapshot?.data() {
                let consejoTexto = data["Consejo"]! as? String
                self.consejo.text = consejoTexto
            } else {
                print("No se encontro el documento")
            }
        }
    }
    
}
