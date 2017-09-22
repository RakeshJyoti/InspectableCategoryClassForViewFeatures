//
//  Listing.swift
//  DemoMenu
//
//  Created by Techpro Studio on 9/22/17.
//  Copyright © 2017 Techpro Studio. All rights reserved.
//

import UIKit
import UIKit


class ProductCell: UICollectionViewCell {
    
}



class Listing: UIViewController {

    
    @IBOutlet weak var collectionProductList: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionProductList.register(ProductCell.self, forCellWithReuseIdentifier: "proCell")
        collectionProductList.register(UINib.init(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "proCell")

        // Do any additional setup after loading the view.
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
}


extension Listing: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.size.width - 30)/2, height: 100) // The size of one cell
    }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10;
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "proCell", for: indexPath) as! ProductCell
        
        return cell
    }
}


extension Listing: UICollectionViewDelegate {
    
    
}






