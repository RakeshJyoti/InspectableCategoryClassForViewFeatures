//
//  BaseViewController.swift
//  DemoMenu
//
//  Created by Techpro Studio on 9/20/17.
//  Copyright © 2017 Techpro Studio. All rights reserved.
//

import UIKit

class MenuDrawer: UIView
{
    @IBOutlet weak var viewMenuListing: UIView?
    @IBOutlet weak var tblMenuList: UITableView?
    @IBOutlet weak var cnstMenuListingLeading: NSLayoutConstraint!
    @IBOutlet weak var imgBG: UIImageView!
    @IBOutlet weak var btnBG: UIButton!

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
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



class BaseViewController: UIViewController
{
    
//    @IBOutlet weak var viewMenuList: UIView!
//    @IBOutlet weak var viewMenuBtnBG: UIView!

    
    
//    let arrayViews: [UIView] = UINib.init(nibName: "BaseViewController", bundle: nil).instantiate(withOwner: self, options: nil) as! [UIView]

    var menuDrawer: MenuDrawer!
        
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        menuDrawer = UINib.init(nibName: "MenuSlider", bundle: nil).instantiate(withOwner: self, options: nil).first as! MenuDrawer
        self.view.addSubview(menuDrawer)
        menuDrawer.frame = UIScreen.main.bounds
        menuDrawer.isHidden = true
        menuDrawer.closeMenu()


       let menuBtn = (UINib.init(nibName: "MenuButton", bundle: nil).instantiate(withOwner: self, options: nil) as! [UIView]).first
        self.view.addSubview(menuBtn!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func didTapMenuBtn(_ sender: UIButton)
    {
        menuDrawer.openCloseMenuToogle()
    }

}
