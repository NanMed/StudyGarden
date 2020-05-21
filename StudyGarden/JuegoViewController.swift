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
        
        let stackView = UIStackView(arrangedSubviews: [
            undoButton,
            clearButton
        ])
        
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.translateAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo:
            view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalto:
            view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo:
            view.trailingAnchor).isActive = true
    }
    


}
