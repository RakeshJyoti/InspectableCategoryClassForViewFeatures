//
//  CategoryFiles.swift
//  DemoMenu
//
//  Created by Techpro Studio on 9/21/17.
//  Copyright © 2017 Techpro Studio. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    // OUTPUT 1
    @IBInspectable var dropShadow: Bool {
        set {
            if newValue
            {
                dropShadow()
            }else
            {
                dropShadow(color: UIColor.clear)
            }
        }
        
        get {
            return false
        }
    }

    
    @IBInspectable var shadowColor: UIColor {
        set {
            self.layer.shadowColor = newValue.cgColor
        }
        
        get {
            return UIColor(cgColor: layer.shadowColor!)
        }
    }

    
    @IBInspectable var shadowOffset: CGSize {
        set {
            self.layer.shadowOffset = newValue
        }
        
        get {
            return layer.shadowOffset
        }
    }

    
    
    // OUTPUT 2
    func dropShadow(color: UIColor = UIColor.black, opacity: Float = 0.5, offSet: CGSize = CGSize(width: -1, height: 1), radius: CGFloat = 1, scale: Bool = true)
    {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    
    @IBInspectable var cornorRadious: CGFloat {
        
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = false
        }
        
        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable var borderUIColor: UIColor {
        set {
            self.layer.borderColor = newValue.cgColor
        }
        
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }

    @IBInspectable var borderWidth: CGFloat{
        set {
            self.layer.borderWidth = newValue
        }
        
        get {
            return self.layer.borderWidth
        }
    }

    
    
}



