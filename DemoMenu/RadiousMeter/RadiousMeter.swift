//
//  RadiousMeter.swift
//  DemoMenu
//
//  Created by Techpro Studio on 9/22/17.
//  Copyright © 2017 Techpro Studio. All rights reserved.
//

import UIKit

class RadiousMeter: UIView
{

    @IBOutlet weak var viewHalfCircle: UIView!
    @IBOutlet weak var viewHalfPointer: UIView!
    @IBOutlet weak var cnstCenterX: NSLayoutConstraint!

    
    
    var isTouchedOnPointer: Bool = false
    var shapeLayer = CAShapeLayer()

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
    class func initWitXibWith() -> RadiousMeter
    {
        let radiousMeterr = UINib.init(nibName: "RadiousMeter", bundle: nil).instantiate(withOwner: self, options: nil).first as! RadiousMeter
        
        
        return radiousMeterr
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rotatePointerWith(angle: -10.0)
    }
    
    
    func setFrame(frame: CGRect)
    {
        self.frame = frame
        cnstCenterX.constant = -(frame.size.width/2)
        viewHalfCircle.layer.cornerRadius = viewHalfCircle.frame.size.width/2
   
        self.layoutIfNeeded()
//        rotatePointerWith(angle: -10.0)

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touches.first
        let view = touch?.view
        if view == viewHalfPointer
        {
            isTouchedOnPointer = true
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if isTouchedOnPointer
        {
            let touch = touches.first!
            let location = touch.location(in: self)
            
            let centerHalfCircle = viewHalfCircle.center
            
            
            let angle = getAngleFromPoints(first: CGPoint.init(x: centerHalfCircle.x, y: 0), second: centerHalfCircle, third: location)
            
            rotatePointerWith(angle: angle)
        }
    }
    
    
    func rotatePointerWith(angle: CGFloat)
    {
        print("angleDegree: %.1f°, ", angle);

        let paddingAngle: CGFloat = 7
        if fabs(angle) > paddingAngle && fabs(angle) < (180 - paddingAngle)
        {
            let actualAngle = angle * CGFloat(Double.pi / 180)
            //        actualAngle = actualAngle - CGFloat(Double.pi / 2)
            
            viewHalfPointer.transform = CGAffineTransform.init(rotationAngle: -actualAngle);
            
            
            /////////////////// draw circle///////////////////
            let startAngle = CGFloat(Double.pi / 2)
            let endAngle = fabs(actualAngle) - startAngle
            
            let circlePath = UIBezierPath(arcCenter: viewHalfCircle.center, radius: viewHalfCircle.frame.size.width/2 - viewHalfCircle.borderWidth/2, startAngle: startAngle, endAngle:endAngle, clockwise: true)
            
            shapeLayer.path = circlePath.cgPath
            
            //change the fill color
            shapeLayer.fillColor = UIColor.clear.cgColor
            //you can change the stroke color
            shapeLayer.strokeColor = UIColor.red.cgColor
            //you can change the line width
            shapeLayer.lineWidth = viewHalfCircle.borderWidth
            
            self.layer.addSublayer(shapeLayer)
        }
    }
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        isTouchedOnPointer = false
    }
    
    
    
    
    func getAngleFromPoints(first: CGPoint, second: CGPoint, third: CGPoint) -> CGFloat
    {
        let vec1: CGVector = CGVector.init(dx: first.x - second.x, dy: first.y - second.y)
        let vec2: CGVector = CGVector.init(dx: third.x - second.x, dy: third.y - second.y)
        
        let theta1: CGFloat = CGFloat(atan2f(Float(vec1.dy), Float(vec1.dx)));
        let theta2: CGFloat = CGFloat(atan2f(Float(vec2.dy), Float(vec2.dx)));
        
        let angleRadien: CGFloat = theta1 - theta2;
        let angleDegree: CGFloat = angleRadien * CGFloat(180 / Double.pi)
        
//        print("angleRadien: %.1f°,", angleRadien);
//        
//        print("angleDegree: %.1f°, ", angleDegree);
        
        return angleDegree
        
    }
    

    
}
