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
    
    
    var superviewTmp: UIView?
    
    
    
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
        self.isHidden = false
        self.backgroundColor = UIColor.init(white: 0.4, alpha: 0.0)
        
        superviewTmp = self.superview
        UIApplication.shared.keyWindow?.addSubview(self)
        
        cnstMenuListingLeading.constant = 0

        UIView.animate(withDuration: 0.25) { 
            self.superviewTmp?.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
            self.backgroundColor = UIColor.init(white: 0.4, alpha: 0.7)
            self.layoutIfNeeded()
        }
    }
    
    
    func closeMenu()
    {
        cnstMenuListingLeading.constant = -(viewMenuListing?.frame.size.width)!

        UIView.animate(withDuration: 0.25, animations: {
            
            self.superviewTmp?.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            self.backgroundColor = UIColor.init(white: 0.4, alpha: 0.0)
            self.layoutIfNeeded()

        }) { (isFinished) in
            
            self.superviewTmp?.addSubview(self)
            self.superviewTmp = nil
            self.isHidden = true
        }
    }
    
    
    @IBAction func didTapMenuBackground(_ sender: UIButton)
    {
        closeMenu()
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
