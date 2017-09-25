//
//  BaseVCViewClasses.swift
//  DemoMenu
//
//  Created by Techpro Studio on 9/22/17.
//  Copyright © 2017 Techpro Studio. All rights reserved.
//

import Foundation
import UIKit


class MenuDrawer: UIView
{
    @IBOutlet weak var viewMenuListing: UIView?
    @IBOutlet weak var tblMenuList: UITableView?
    @IBOutlet weak var cnstMenuListingLeading: NSLayoutConstraint!
    @IBOutlet weak var imgBG: UIImageView!
    @IBOutlet weak var btnBG: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
        

    }
    
    
    func openCloseMenuToogle()
    {
        if isMenuOpened()
        {
            closeMenu()
        }else
        {
            openMenu()
        }
    }
    
    
    func isMenuOpened() -> Bool
    {
        return cnstMenuListingLeading.constant == 0
    }
    
    
    
    func openMenu()
    {
        imgBG.image = captureScreen()
        
        self.isHidden = false
        self.btnBG.backgroundColor = UIColor.init(white: 0.0, alpha: 0.0)
        
        cnstMenuListingLeading.constant = 0
        
        UIView.animate(withDuration: 0.25) {
            self.imgBG.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
            self.btnBG.backgroundColor = UIColor.init(white: 0.0, alpha: 0.7)
            self.layoutIfNeeded()
        }
    }
    
    
    func closeMenu()
    {
        cnstMenuListingLeading.constant = -(viewMenuListing?.frame.size.width)!
        
        UIView.animate(withDuration: 0.25, animations: {
            
            self.imgBG.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            self.btnBG.backgroundColor = UIColor.init(white: 0.0, alpha: 0.0)
            self.layoutIfNeeded()
            
        }) { (isFinished) in
            
            self.isHidden = true
        }
    }
    
    
    @IBAction func didTapMenuBackground(_ sender: UIButton)
    {
        closeMenu()
    }
    
    
    func captureScreen() -> UIImage?
    {
        UIGraphicsBeginImageContextWithOptions((superview?.bounds.size)!, false, UIScreen.main.scale)
        superview?.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}



class MenuListCell: UITableViewCell {
    
}



class MenuListHeader: UIView {
    
    typealias CompletionBlock = (_ result: NSData?, _ error: NSError?) -> Void

    var completion: CompletionBlock?
    
    
    
    @IBAction func didTapHeaderBtn(_ sender: UIButton) {
        
        completion!(nil, nil)
    }
}



//typealias CompletionBlock = (NSString?) -> Void
//// or
//typealias CompletionBlock = (result: NSData?, error: NSError?) -> Void
//var completion: CompletionBlock = { reason in print(reason) }
//var completion: CompletionBlock = { result, error in print(error) }




