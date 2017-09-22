//
//  BaseViewController.swift
//  DemoMenu
//
//  Created by Techpro Studio on 9/20/17.
//  Copyright © 2017 Techpro Studio. All rights reserved.
//

import UIKit



class BaseViewController: UIViewController
{
    
    var menuDrawer: MenuDrawer!
    var selectedRow: NSInteger = -121
        
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        menuDrawer = UINib.init(nibName: "MenuSlider", bundle: nil).instantiate(withOwner: self, options: nil).first as! MenuDrawer
        self.view.addSubview(menuDrawer)
        menuDrawer.frame = UIScreen.main.bounds
        menuDrawer.isHidden = true
        menuDrawer.closeMenu()
        
        
        menuDrawer.tblMenuList?.register(MenuListCell.self, forCellReuseIdentifier: "proCell")
        menuDrawer.tblMenuList?.register(UINib.init(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "proCell")
        

//        menuDrawer.tblMenuList?.register(MenuListHeader.self, forHeaderFooterViewReuseIdentifier: "menuHeader")
//        menuDrawer.tblMenuList?.register(UINib.init(nibName: "MenuCellHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "menuHeader")

        menuDrawer.tblMenuList?.delegate = self
        menuDrawer.tblMenuList?.dataSource = self
        
        
        

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


extension BaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 40
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return selectedRow == section ? 10 : 0;
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = (UINib.init(nibName: "MenuCellHeader", bundle: nil).instantiate(withOwner: self, options: nil) as! [UIView]).first as! MenuListHeader
        headerView.completion = { result, error in
            
            print(error ?? "")
        
            if self.selectedRow != section
            {
                self.selectedRow = section
            }else
            {
                self.selectedRow = -231
            }
            
            tableView.reloadSections(IndexSet.init(integersIn: 0...(tableView.numberOfSections - 1)), with: .fade)

        }
        
        
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "proCell") as! MenuListCell
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
    }
}





