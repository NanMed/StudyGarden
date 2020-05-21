//
//  Canvas.swift
//  StudyGarden
//
//  Created by user168001 on 5/21/20.
//  Copyright © 2020 ProyectoFinal. All rights reserved.
//

import UIKit

class Canvas: UIView{
    
    func undo() {
        _ = lines.popLast()
        setNeedsDisplay()
    }
    
    func clear(){
        lines.removeAll()
        setNeedsDisplay()
    }
    
     fileprivate var lines = [[CGPoint]]()
    
    override func draw(_rect: CGRect){
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else{return}
        
//        let startPoint = CGPoint(x:0, y:0)
//        let endPoint = CGPoint(x:100, y:100)
//        context.move(to:startPoint)
//        context.addLine(to: endPoint)
        
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(10)
        context.setLineCap(.butt)
        
        lines.forEach{(line) in
            for(i,p) in line.enumerated(){
                if i = 0 {
                    context.move(to:p)
                }else{
                    context.addLine(to: p)
                }
            }
        }
        
        
        context.strokePath()
        
        
    }
    
    //var line = [CGPoint]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let point = touches.first?.location(in:nil) else {return}
        //print(point)
        
        guard var latLine = line.popLast() else {return}
        lastLine.append(point)
        lines.append(lastLine)
        
//        let lastLine = lines.last
//        lastLine?.append(point)
        
        //line.append(point)
        setNeedsDisplay()
        
    }
}

