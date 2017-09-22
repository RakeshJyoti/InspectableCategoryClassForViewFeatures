//
//  ViewController.swift
//  DemoMenu
//
//  Created by Techpro Studio on 9/20/17.
//  Copyright © 2017 Techpro Studio. All rights reserved.
//

import UIKit

class ViewController: BaseViewController
{
    
    @IBOutlet weak var viewSub: UIView!

    
    let viewRadiuosMeter = RadiousMeter.initWitXibWith()
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewRadiuosMeter.setFrame(frame: viewSub.bounds)
        viewSub.addSubview(viewRadiuosMeter)
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

