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

class ExploraObjetosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var fotoVista: UIImageView!
    @IBOutlet weak var botonCamara: UIButton!
    @IBOutlet weak var resultadoML: UILabel!
    @IBOutlet weak var consejo: UILabel!
    
    private let miPicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        consejo.isHidden = false
        //instanciar el modelo de la red neuronal
        let modelFile = ProyectoSG()
        let model = try! VNCoreMLModel(for: modelFile.model)
        //Convertir la imagen obtenida a CIImage
        let imagenCI = CIImage(image: fotoVista.image!)
        //Crear un controlador para el manejo de la imagen, este es un requerimiento para ejecutar la solicitud del modelo
        let handler = VNImageRequestHandler(ciImage: imagenCI!)
        //Crear una solicitud al modelo para el análisis de la imagen
        let request = VNCoreMLRequest(model: model, completionHandler: resultadosModelo)
        //print("aqui ya no")
        try! handler.perform([request])
    }
    
    func resultadosModelo(request: VNRequest, error: Error?)
    {
        //print("aqui si")
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
        
        if(resultado.elementsEqual("Basura")){
            consejo.text = "Tirar la basura regularmente es un buen hábito"
        } else if(resultado.elementsEqual("Cables")){
            consejo.text = "Ten tus cables organizados para no romperlos"
        } else if(resultado.elementsEqual("Cigarros")){
            consejo.text = "Genera una mala reputación personal"
        } else if(resultado.elementsEqual("Dinero")){
            consejo.text = "No olvides guardar tus objetos valiosos"
        } else if(resultado.elementsEqual("Maquillaje")){
            consejo.text = "Siempre guarda tu maquillaje en el bolso"
        } else if(resultado.elementsEqual("Mochila")){
            consejo.text = "Coloca tu mochila en un espacio designado"
        } else if(resultado.elementsEqual("Nota adhesiva")){
            consejo.text = "Ayuda a la organización personal"
        } else if(resultado.elementsEqual("Plato")){
            consejo.text = "No tengas platos en tu espacio"
        } else if(resultado.elementsEqual("Producto higiene")){
            consejo.text = "Siempre guarda tus productos de higiene"
        } else if(resultado.elementsEqual("Taza")){
            consejo.text = "Siempre lavar tu taza después de usarla"
        }
    }
}
