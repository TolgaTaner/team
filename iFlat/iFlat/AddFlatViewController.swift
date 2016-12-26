//
//  AddFlatViewController.swift
//  iFlat
//
//  Created by Tolga Taner on 13.12.2016.
//  Copyright © 2016 SE 301. All rights reserved.
//

import MobileCoreServices
import UIKit

class AddFlatViewController: UIViewController {
    
    
    var addingFlat = Flat()
    
    
var imageCounter = 1
    
    @IBOutlet weak var priceTextField: UITextField!{
        didSet{
            
            priceTextField.delegate = self
        }
    }
    
    

    @IBOutlet weak var addressTextView: UITextView!{
        
        didSet{
            
             addressTextView.layer.cornerRadius = 10
            addressTextView.delegate = self
        }
    }
    
    /*
     var disabled: Bool?
     var DB_ENDPOINT:FIRFlat
     var title:String?
     var flatDescription:String?
     var city:String?
     var address:String?
     var flatCapacity:Int?
     var bathroomCount:Int?
     var bedCount:Int?
     var bedroomCount:Int?
     var pool:Bool?
     var internet:Bool?
     var cooling:Bool?
     var heating:Bool?
     var tv:Bool?
     var washingMachine:Bool?
     var elevator:Bool?
     var parking:Bool?
     var smoking:Bool?
     var gateKeeper:Bool?
     var price:Double?
     var images:[FlatImage]?
     var userID:String
 */
    
    var imagePicker = UIImagePickerController()
    
    var  defaultHomeImage : [UIImage] = {
        
        return [#imageLiteral(resourceName: "defaulthome"),#imageLiteral(resourceName: "defaulthome"),#imageLiteral(resourceName: "defaulthome"),#imageLiteral(resourceName: "defaulthome"),#imageLiteral(resourceName: "defaulthome")]
        
    }()
    
   
    
    @IBOutlet weak var flatScrollView: UIScrollView!
    
    @IBOutlet weak var flatDescriptionTextView: UITextView!{
        
        didSet {
            
        flatDescriptionTextView.delegate = self
        flatDescriptionTextView.layer.cornerRadius = 10
            
        }
    }
    
    
    @IBOutlet var popUpView: UIView!
    
       
    @IBOutlet weak var flatTitleTextField: UITextField!{
        
        didSet{
            
            flatTitleTextField.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        setImage()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    
   
  
    @IBAction func addFlatButtonAction(_ sender: Any) {
  
    }
    
  
    
     func setImage(){
            for  i in  0..<defaultHomeImage.count {
            
            let imageView = UIImageView()
            imageView.image = defaultHomeImage[i]
                imageView.contentMode = .scaleAspectFit
            let xPosition =  self.flatScrollView.frame.width * CGFloat(i)
            imageView.frame = CGRect(x:xPosition,y:0,width: self.flatScrollView.frame.width,height: self.flatScrollView.frame.height)
            flatScrollView.contentSize.width =  flatScrollView.contentSize.width + imageView.frame.width
            flatScrollView.addSubview(imageView)
            
        }
       

    }
    
    func changeImageWithBefore(){
        for  i in  0..<defaultHomeImage.count {
            
            let imageView = UIImageView()
            imageView.image = defaultHomeImage[i]
            imageView.contentMode = .scaleAspectFit
            let xPosition =  self.flatScrollView.frame.width * CGFloat(i)
            imageView.frame = CGRect(x:xPosition,y:0,width: self.flatScrollView.frame.width,height: self.flatScrollView.frame.height)
    
            flatScrollView.addSubview(imageView)
            
        }
        
        
    }
 

    @IBAction func openFlatOptionButtonAction(_ sender: Any) {
        
        UIView.animate(withDuration: 0.4, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
             self.showFlatOptionsPopUp()
        }, completion: nil)
    }
   

    
    
    @IBAction func titleTextFieldEditingEnd(_ sender: UITextField) {
     //TODO:FLAT TİTLE WİL BE SET.
    }
    
    
    private func showFlatOptionsPopUp() {
        
        self.view.addSubview(popUpView)
        
        popUpView.center = self.view.center
        
        
    }
    
    @IBAction func optionActionFinished(_ sender: Any) {
        popUpView.removeFromSuperview()

        
    }
    @IBAction func choosePhotoAction(_ sender: Any) {
        
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
            
        }
        else {
defaultAlert()
            
        }
        
    }
    
}


extension AddFlatViewController : UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate,ShowAlert{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
       
        
        if textView.tag == 0 {
            
            
            addingFlat.address = textView.text
            
        }
        
        else {
            
            addingFlat.flatDescription = textView.text
            
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        let mediaType  = info[UIImagePickerControllerMediaType] as! String
        
        
        if mediaType == (kUTTypeImage as String) {
           self.defaultHomeImage.insert((info[UIImagePickerControllerOriginalImage] as? UIImage)!, at: imageCounter-1)
          
            defaultHomeImage.removeLast()
          flatScrollView.willRemoveSubview(flatScrollView.subviews.last!)
            
            if imageCounter == 5 {
                imageCounter = 1
                
            }
            else {
                imageCounter += 1
                
            }
                 changeImageWithBefore()
         
        }
        
        
        picker.dismiss(animated: true, completion: nil)
    }
    
   
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            flatDescriptionTextView.resignFirstResponder()
            addressTextView.resignFirstResponder()
            return false
        }
        
        return true
    }

   
}





 
