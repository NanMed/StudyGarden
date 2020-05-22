//
//  JuegoViewController.swift
//  StudyGarden
//
//  Created by user168001 on 5/20/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit

class JuegoViewController: UIViewController {

    let canvas = Canvas()
    
    let undoButton: UIButton = {
        let button = UIButton(type:.system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func handleUndo(){
        print("Undo lines done")
        canvas.undo()
    }
    
    let clearButton: UIButton = {
        let button = UIButton(type:.system)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func handleClear(){
        canvas.clear()
    }
    
    let yellowButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let redButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    let blueButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleColorChange), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func handleColorChange(button: UIButton){
        canvas.setStrokecolor(color:button.backgroundColor ?? .black)
    }

    let slider = UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        return slider
    }
    
    @objc fileprivate func handleSliderChange(){
        canvas.setStrokeWidth(width: slider.value)
    }
    
    override func loadView() {
        self.view = canvas
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        canvas.backgroundColor = .white
        setupLayout()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func setupLayout(){
        
        let colorsStackView = UIStackView(arrangedSubviews: [yellowButton,redButton,blueButton])
        colorsStackView.distribution = .fillEqually
        
        let stackView = UIStackView(arrangedSubviews: [
            undoButton,
            clearButton,
            colorsStackView,
            slider
        ])

        stackView.spacing = 12
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.translateAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo:
            view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalto:
            view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo:
            view.trailingAnchor, constant: -8).isActive = true
    }
    


}
