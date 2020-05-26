//
//  MusicaController.swift
//  StudyGarden
//
//  Created by Nancy Medina on 25/05/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit
import AVFoundation

class MusicaController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imgSeleccionada: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    private let pickerImg = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let sound = Bundle.main.path(forResource: "song", ofType: "mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, mode: AVAudioSessionModeDefault, options: [AVAudioSession.CategoryOptions.mixWithOthers])
        } catch {
            print(error)
        }
    }
    

    @IBAction func selImgAlbum(_ sender: Any) {
        pickerImg.sourceType = UIImagePickerController.SourceType.photoLibrary
        present(pickerImg, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imgSeleccionada.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func play(_ sender: Any) {
        audioPlayer.play()
    }
    
    @IBAction func pausa(_ sender: Any) {
        audioPlayer.pause()
    }

}
