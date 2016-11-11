//
//  ViewController.swift
//  LineAnimationDemo
//
//  Created by Ryan Stickel on 10/27/16.
//  Copyright © 2016 ApresActive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidLayoutSubviews() {
        
        print("frame: \(self.view.frame)")
        
        drawLinesTest1()
    }
    
    
    func drawLinesTest1() {
        
        drawLineFromPoint(CGPoint(x: 20.0, y: 20.0), toPoint: CGPoint(x: self.view.frame.size.width-20, y: 150.0), ofColor: UIColor.yellow, inView: self.view)
        
        drawLineFromPoint(CGPoint(x: self.view.frame.size.width-20, y: 150.0), toPoint: CGPoint(x: 20.0, y: 350.0), ofColor: UIColor.orange, inView: self.view)
        
        drawLineFromPoint(CGPoint(x: 20.0, y: 350.0), toPoint: CGPoint(x: self.view.frame.size.width-20, y: self.view.frame.size.height-20), ofColor: UIColor.green, inView: self.view)
        
    }
    
    
    func drawLineFromPoint(_ start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {
        
        //design the path
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        
        //path.addLine(to: CGPoint(x: self.view.frame.size.width-20, y: 150.0))
        //path.addLine(to: CGPoint(x: 20.0, y: 350.0))
        //path.addLine(to: CGPoint(x: self.view.frame.size.width-20, y: self.view.frame.size.height-20
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 3.0
        shapeLayer.shadowRadius = 6.0
        shapeLayer.shadowColor = lineColor.cgColor
        shapeLayer.shadowOpacity = 0.4
        shapeLayer.shadowOffset = CGSize(width: 0.0, height: 0.0)
         
        view.layer.addSublayer(shapeLayer)
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: 150, height: 3)
        gradient.shadowRadius = 9.0
        gradient.shadowColor = lineColor.cgColor
        gradient.shadowOpacity = 0.8
        gradient.shadowOffset = CGSize(width: 0.0, height: 0.0)
        gradient.cornerRadius = 8.0
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5) //CGPoint(0.0, 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5) //CGPoint(1.0, 0.5)
        
        if (lineColor.isEqual(UIColor.yellow)) {
            gradient.colors = [UIColor.clear.cgColor, UIColor.yellow.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.clear.cgColor]
        } else if (lineColor.isEqual(UIColor.orange)) {
            gradient.colors = [UIColor.clear.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.orange.cgColor, UIColor.clear.cgColor]
        } else if (lineColor.isEqual(UIColor.green)) {
            gradient.colors = [UIColor.clear.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.yellow.cgColor, UIColor.clear.cgColor]
        } else {
            gradient.colors = [UIColor.clear.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.yellow.cgColor, UIColor.clear.cgColor]
        }
        
        view.layer.addSublayer(gradient)
        
        let anim = CAKeyframeAnimation.init(keyPath: "position")
        anim.path = path.cgPath
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.duration = 1.5
        anim.fillMode = kCAFillModeForwards
        gradient.add(anim, forKey: "gradient")
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
