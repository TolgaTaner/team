//
//  EditPhotoViewController.swift
//  iFlat
//
//  Created by Tolga Taner on 29.12.2016.
//  Copyright © 2016 SE 301. All rights reserved.
//

import UIKit

class EditPhotoViewController: UIViewController,imageMaker {

    @IBOutlet weak var editPhotoCollectionView: EditPhotoCollectionView!
    
   
    
    var flatImage = [FlatImage]()
  
    var firebase = FIRFlat()
    
    var flat = Flat()
    
    @IBOutlet weak var popUpView: UIView!{
        didSet{
            popUpView.layer.cornerRadius = 10
            popUpView.layer.masksToBounds = true

            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        
        firebase.getFlatImages(flatID:flat.id) { (urlImagesURL) in
            
            for url in urlImagesURL! {
                
            self.urlToImage(url: url.imageDownloadURL, completionHandler: { (image) in
                
                self.editPhotoCollectionView.flatImages.append(FlatImage(image: image))
                
            })
            }
            
                
          //  self.editPhotoCollectionView.flatImages.insert(FlatImage(image: tmpImage.image!), at: 0)
                
         
            self.editPhotoCollectionView.reloadData()
         
        }
        
   
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller : EditFlatViewController = segue.destination as? EditFlatViewController {
            
         //  controller.editingFlat.images = editPhotoCollectionView.flatImages
        }
        
        
        
    }
}
