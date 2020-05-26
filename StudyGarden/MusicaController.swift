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

    
    @IBOutlet weak var textoRel: UILabel!
    @IBOutlet weak var imgSeleccionada: UIImageView!
    
    var audioPlayer: AVAudioPlayer!
    private let pickerImg = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textoRel.isHidden = true
        let sound = Bundle.main.path(forResource: "song", ofType: "mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, mode: AVAudioSessionModeDefault, options: [AVAudioSession.CategoryOptions.mixWithOthers])
        } catch {
            print(error)
        }
        
    }
    
    @IBAction func cambiar(_ sender: Any) {
        textoRel.isHidden = false
        imgSeleccionada.image = UIImage(named: "paisaje1")
    }
    
    @IBAction func cambiarP2(_ sender: Any) {
        textoRel.isHidden = false
        imgSeleccionada.image = UIImage(named: "paisaje2")
    }
    
    @IBAction func cambiarP3(_ sender: Any) {
        textoRel.isHidden = false
        imgSeleccionada.image = UIImage(named: "paisaje3")
    }
    
    @IBAction func cambiarP4(_ sender: Any) {
        textoRel.isHidden = false
        imgSeleccionada.image = UIImage(named: "paisaje4")
    }
    
    @IBAction func play(_ sender: Any) {
        audioPlayer.play()
    }
    
    @IBAction func pausa(_ sender: Any) {
        audioPlayer.pause()
    }

}
