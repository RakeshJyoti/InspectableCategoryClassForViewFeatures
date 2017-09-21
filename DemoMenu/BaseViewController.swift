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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @IBOutlet weak var viewMenuListing: UIView?
    @IBOutlet weak var tblMenuList: UITableView?
}



class BaseViewController: UIViewController
{
    
//    @IBOutlet weak var viewMenuList: UIView!
//    @IBOutlet weak var viewMenuBtnBG: UIView!

    
    
//    let arrayViews: [UIView] = UINib.init(nibName: "BaseViewController", bundle: nil).instantiate(withOwner: self, options: nil) as! [UIView]

    

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
       let menuBtn = (UINib.init(nibName: "MenuButton", bundle: nil).instantiate(withOwner: self, options: nil) as! [UIView]).first
        self.view.addSubview(menuBtn!)

        let menuDrawer: MenuDrawer = UINib.init(nibName: "MenuSlider", bundle: nil).instantiate(withOwner: self, options: nil).first as! MenuDrawer
        self.view.addSubview(menuDrawer)
        
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
        print("menu called")
    }

}
