//
//  Canvas.swift
//  StudyGarden
//
//  Created by user168001 on 5/21/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit

class Canvas: UIView{
    
    fileprivate var strokeColor = UIColor.black
    fileprivate var strokeWidth: Float = 1
    
    func setStrokeWidth(width: Float) {
        self.strokeWidth = width
    }
    
    func setStrokecolor(color:UIColor){
        self.strokeColor = color
    }
    
    func undo() {
        _ = lines.popLast()
        setNeedsDisplay()
    }
    
    func clear(){
        lines.removeAll()
        setNeedsDisplay()
    }
    
    fileprivate var lines = [Line]()
    
    override func draw(_ rect: CGRect){
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else{return}

        
        context.setLineCap(.butt)
        
        lines.forEach { (line) in
            context.setStrokeColor(line.color.cgColor)
            context.setLineWidth(CGFloat(line.strokeWidth))
            context.setLineCap(.round)
            for(i,p) in line.points.enumerated(){
                if i == 0 {
                    context.move(to:p)
                }else{
                    context.addLine(to: p)
                }
            }
            context.strokePath()
        }
        
        
    }
    
    //var line = [CGPoint]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(Line.init(strokeWidth: strokeWidth, color: strokeColor, points: []))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let point = touches.first?.location(in:nil) else {return}
        //print(point)
        
        guard var lastLine = lines.popLast() else {return}
        //Tengo duda si es points o point
        lastLine.points.append(point)
        lines.append(lastLine)
        setNeedsDisplay()
        
    }
}

